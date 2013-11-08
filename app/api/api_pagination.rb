module ApiPagination
  Infinity = 1.0/0

  class Range < Grape::Validations::SingleOptionValidator
    def validate_param!(attr_name, params)
      unless (!@required && params[attr_name].nil?) || @option.include?(params[attr_name])
        throw :error, status: 400, message: "#{attr_name}: must be within #{@option}"
      end
    end
  end

  def self.included where
    where.class_eval do
      helpers Helpers

      def self.paginable
        params do
          optional :page,   type: Integer, default: 1, range: 1..Infinity,
                   desc: 'The page to retrieve. Defaults to the first page. (1..)'
          optional :offset, type: Integer, default: nil, range: 0..Infinity,
                   desc: 'Offset from start of this collection. Defaults to 0. (0..) Not used when page is given.'
          optional :limit,  type: Integer, default: 100, range: 1..1000,
                   desc: 'Number of results to retrieve, either as page size or starting from offset. ' +
                         'Defaults to 100 per page, if page is given. (1..1000)'
        end
        @last_description[:paginable] = true
      end
    end
  end

  module Helpers
    def present *args
      element = args[0]
      remain  = args[1..-1]
      if @options[:route_options][:paginable] &&
          (element.is_a?(Array) || element.is_a?(ActiveRecord::Relation))
        super({
                  metadata: {
                      page: params[:page],
                      offset: params[:offset],
                      limit: params[:limit],
                      total_pages: (params[:page] && params[:limit]) ?
                          (element.size.to_f / params[:limit]).ceil : nil,
                      total_size: element.size
                  }.reject {|k,v| v.nil? },
                  result: super(paginate element, *remain)
              }, *remain)
      else
        super({ result: super(*args) }, *remain)
      end
    end

    private

    def paginate(coll, options = {})
      if params[:page]
        page = params[:page].to_i
        size = params[:limit].to_i
        error!("Invalid page: #{page}", 400) if page < 0
        error!("Invalid page size: #{size}", 400) if size <= 0
        if coll.respond_to?(:page)
          coll = coll.page(page).per(size)
        elsif coll.respond_to?(:offset) and coll.respond_to?(:limit)
            coll = coll.offset(size * (page - 1)).limit(size)
        elsif coll.respond_to?(:skip) and coll.respond_to?(:limit)
          coll = coll.skip(size * (page - 1)).limit(size)
        elsif coll.is_a?(Array)
          coll = coll[((page - 1) * size)...(page * size)]
        else
          error!("Cannot paginate #{coll.class.name}", 500)
        end
      else
        if params[:offset]
          offset = params[:offset].to_i
          error!("Invalid offset: #{offset}", 400) if offset < 0
          if coll.respond_to?(:offset)
            coll = coll.offset(offset)
          elsif coll.respond_to?(:skip)
            coll = coll.skip(offset)
          elsif coll.is_a?(Array)
            coll = coll[offset..-1]
          else
            error!("Cannot offset #{coll.class.name}", 500)
          end
        end
        limit = nil
        if params[:limit]
          limit = params[:limit].to_i
          error!("Invalid limit: #{limit}", 400) if limit <= 0
          limit = [ limit, options[:max_size] ].min if options[:max_size]
        elsif options[:max_size]
          limit = options[:max_size].to_i
        end
        if limit
          if coll.respond_to?(:limit)
            coll = coll.limit(limit)
          elsif coll.is_a?(Array)
            coll = coll[0..limit - 1]
          else
            error!("Cannot limit #{coll.class.name}", 500)
          end
        end
      end
      (coll.is_a?(Module) and coll.respond_to?(:all)) ? coll.all : coll
    end
  end
end
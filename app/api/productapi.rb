module Productapi
    class API < Grape::API
        include ApiPagination
        include Util

        helpers do
            def update_date
                params[:update_after] ? Date.parse(params[:update_after]) : nil
            end
        end

        resource :product do

            # /product/<barcode>
            desc "Return the information of the given bar-code"
            params do
                requires :barcode, type: String, desc: "bar-code"
            end
            route_param :barcode do
                get do
                    Product.where(:barcode => params[:barcode]).first
                end
            end

            # /product/
            desc "Get all food"
            paginable
            get do
                if update_date
                    present Product.where("updated_at > ?", update_date)
                else
                    present Product.all
                end
            end
        end

    end
end



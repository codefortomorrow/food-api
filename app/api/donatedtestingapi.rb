module Donatedtestingapi
    class API < Grape::API
    include ApiPagination
    include Util
        
        helpers do 
            def update_date
                params[:update_after] ? Date.parse(params[:update_after]) : nil
            end
        end

        resource :donatedtesting do

            # /donatedtesting/<barcode>
            desc "Return the information of the given testing id"
            params do 
                requires :id, type: String, desc: "testing id"
            end
            route_param :id do
                get do
                    Donatedtesting.find(params[:id])
                end
            end

            # /donatedtesting/
            desc "Get all food"
            paginable
            get do
                if update_date
                    present Donatedtesting.where("updated_at > ?", update_date)
                else
                    present Donatedtesting.all
                end
            end
        end

    end
end



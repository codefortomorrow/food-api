module Foodapi
    class API < Grape::API
    include ApiPagination
        
        helpers do 
            def update_date
                params[:update_after] ? Date.parse(params[:update_after]) : nil
            end
        end

        resource :food do

            # /food/<barcode>
            desc "Return the information of the given bar-code"
            params do 
                requires :id, type: String, desc: "bar-code"
            end
            route_param :id do
                get do
                    Food.where(:barcode => params[:id]).first
                end
            end

            # /food/
            desc "Get all food"
            paginable
            get do
                if update_date
                    present Food.where("updated_at > ?", update_date)
                else
                    present Food.all
                end
            end
        end

    end
end



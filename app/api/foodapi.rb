module Foodapi
    class API < Grape::API

        resource :food do
            desc "Return the information of the given bar-code"
            params do 
                requires :id, type: String, desc: "bar-code"
            end
            route_param :id do
                get do
                    Food.where(:barcode => params[:id]).first
                end
            end

            desc "Get all food"
            get do
                Food.all
            end
        end



    end
end



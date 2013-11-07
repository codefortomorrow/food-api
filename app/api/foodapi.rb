module Foodapi
    class API < Grape::API

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
            get do
                #header "encoding", "utf-8"
                Food.all
            end
        end



    end
end



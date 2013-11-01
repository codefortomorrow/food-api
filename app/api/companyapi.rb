module Companyapi
    class API < Grape::API

        resource :company do
            desc "Return the information of company given company id"
            params do 
                requires :id, type: String, desc: "company id"
            end
            route_param :id do
                get do
                    Company.where(:id => params[:id])
                end
            end

            desc "Get all companies"
            get do
                Company.all
            end
        end



    end
end



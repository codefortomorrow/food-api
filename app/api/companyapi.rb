module Companyapi
    class API < Grape::API
        include ApiPagination

        resource :company do
            desc "Return the information of company given company id"
            params do
                requires :id, type: String, desc: "company id"
            end
            route_param :id do
                get do
                    Company.find(params[:id])
                end
            end

            desc "Get all companies"
            paginable
            get do
                present Company.all
            end
        end
    end
end



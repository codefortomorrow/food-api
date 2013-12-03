module Userapi
    class API < Grape::API
        
        resource :user do

            # /user/<user id>
            desc "Return the information of the given user id"
            params do 
                requires :id, type: String, desc: "testing id"
            end
            route_param :id do
                get do
                    User.find(params[:id])
                end
            end
        end

    end
end



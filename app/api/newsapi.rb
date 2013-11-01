module Newsapi
    class API < Grape::API

        resource :news do
            desc "Return the news given news id"
            params do 
                requires :id, type: String, desc: "news id"
            end
            route_param :id do
                get do
                    News.find(params[:id])
                end
            end

            desc "Get all news"
            get do
                News.all
            end
        end



    end
end



class API < Grape::API
    version 'v1', using: :header, vendor: 'foodopendata'
    format :json
    content_type :json, "application/json; charset=utf-8"

    mount Foodapi::API
    mount Newsapi::API
    mount Companyapi::API
end

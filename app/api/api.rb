class API < Grape::API
    version 'v1', using: :header, vendor: 'foodopendata'
    format :json
    content_type :json, "application/json; charset=utf-8"

    mount Userapi::API
    mount Foodapi::API
    mount Followapi::API
    mount Newsapi::API
    mount Companyapi::API
    mount Donatedtestingapi::API
end

require 'grape-swagger'

class API < Grape::API
    version 'v1', using: :header, vendor: 'foodopendata'
    format :json
    content_type :json, "application/json; charset=utf-8"

    mount Userapi::API
    mount Productapi::API
    mount Followapi::API
    mount Newsapi::API
    mount Companyapi::API
    mount Donationapi::API

    add_swagger_documentation :mount_path => "api_doc", :base_path => "http://foodopendata-api.herokuapp.com/api"
end

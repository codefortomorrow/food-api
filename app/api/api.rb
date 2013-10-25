class API < Grape::API
    version 'v1', using: :header, vendor: 'foodopendata'
    format :json

    mount Food::API
end

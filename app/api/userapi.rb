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

	resource :login do
	    desc "let user sign in or register a new account if not found"
	    params do
		requires :email, type: String, desc: "the email that user used to register"
		requires :account_type, type: String, desc: "which method that user use when registering"
	    end
	    post do
		user = User.where(:email => params[:email], :account_type => params[:account_type]).first
		# register a new user
		if not user
		    new_user = User.create! do |u|
			u.email = params[:email]
			u.account_type = params[:account_type]
			u.balance = 0
		    end
		else
		    # this is for return
		    cloned_user = user.clone
		    user.last_login_time = Time.new
		    user
		end
	    end
	end

    end
end



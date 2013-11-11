module Followapi
    class API < Grape::API
    include ApiPagination
    include Util
        
        resource :follow do

	    # /follow/
	    desc "create a following relationship given the user id and the food id"
	    params do
		requires :user_id, type: String, desc: "user id"
		requires :food_id, type: Integer, desc: "food id"
	    end
	    post do
		food = Food.where(:id => params[:food_id]).first
		if not food
		    Result.error "error: food id does not exist"
		else
		    fs = Followship.where(:user_id => params[:user_id], :food_id => params[:food_id])
		    if fs.empty?
		        Followship.create!(:user_id => params[:user_id], :food_id => params[:food_id])
		        Result.success
	            else
			Result.error "error: the following relationship already exists"
	            end
		end
	    end

	    desc "delete the follow-ship given the user id and food id"
	    params do
		requires :user_id, type: String, desc: "user id"
		requires :food_id, type: Integer, desc: "food id"
	    end
	    delete do
		fs = Followship.where(:user_id => params[:user_id], :food_id => params[:food_id]).first
		if fs
		    fs.destroy
		    Result.success
		else
		    Result.error "error: the relationship you want to delete does not exist"
		end
	    end
		

            # /follow/{user_id}
            desc "Return the list of followed food product given the user id"
            params do 
                requires :user_id, type: String, desc: "user id"
            end
            route_param :user_id do
		paginable
                get do
                    present Followship.where(:user_id => params[:user_id])
                end
            end

        end

    end
end



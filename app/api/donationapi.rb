module Donationapi
    class API < Grape::API
	include ApiPagination
	include Util

	rescue_from :all do |e|
	    error_response({ result: "fail", message: e.class.name })
	end


	helpers do 
	    def update_date
		params[:update_after] ? Date.parse(params[:update_after]) : nil
	    end
	end

	resource :donatedtesting do

	    # /donatedtesting/<barcode>
	    desc "Return the information of the given testing id"
	    params do 
		requires :id, type: String, desc: "testing id"
	    end
	    route_param :id do
		get do
		    Donatedtesting.find(params[:id])
		end
	    end

	    # /donatedtesting/
	    desc "Get all food"
	    paginable
	    get do
		if update_date
		    present Donatedtesting.where("updated_at > ?", update_date)
		else
		    present Donatedtesting.all
		end
	    end
	end

	resource :donation do

	    # /donation/<user id>
	    desc "Return the donation history of a given user"
	    params do
		requires :user_id, type: String, desc: "user id"
	    end
	    route_param :user_id do
		paginable
		get do
		    present Donation.where(:user_id => params[:user_id])
		end
	    end

	    # /donation/<user id>
	    desc "create a donation"
	    params do
		requires :user_id, type: String, desc: "user id"
		requires :donatedtesting_id, type: String, desc: "testing_id"
		requires :amount, type: Float, desc: "how much the user donates"
	    end
	    route_param :user_id do
		post do
		    user = User.find(params[:user_id])
		    donatedtesting = Donatedtesting.find(params[:donatedtesting_id])
		    Donation.create!(:user_id => params[:user_id], 
				     :donatedtesting_id => params[:donatedtesting_id], 
				     :amount => params[:amount])
		    Result.success
		end
	    end
	end

    end
end



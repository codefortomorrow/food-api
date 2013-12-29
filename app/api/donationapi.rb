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

        resource :testproject do

            # /testproject/<barcode>
            desc "Return the information of the given testing id"
            params do
                requires :id, type: String, desc: "testing id"
            end
            route_param :id do
                get do
                    Testproject.find(params[:id])
                end
            end

            # /testproject/
            desc "Get all food"
            paginable
            get do
                if update_date
                    present Testproject.where("updated_at > ?", update_date)
                else
                    present Testproject.all
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
                requires :testproject_id, type: String, desc: "test project id"
                requires :amount, type: Float, desc: "how much the user donates"
            end
            route_param :user_id do
                post do
                    user = User.find(params[:user_id])
                    project = Testproject.find(params[:testproject_id])
                    Donation.create!(:user_id => params[:user_id],
                                     :testproject_id => params[:testproject_id],
                                     :amount => params[:amount])
                    # update current amount
                    amount = params[:amount].to_f
                    project.current_amount += amount

                    # update the number of donators
                    project.current_donators += 1
                    project.save

                    Result.success
                end
            end
        end

    end
end



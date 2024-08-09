# require 'rest-client'

class UsersController < ApplicationController
    def index
        @users = User.all
        # ApiJob.perform_async()
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                UserMailer.with(user: @user).hello_email.deliver_now
                format.html {redirect_to @user, notice:"User was successfully created."}
                format.json {render json: @user, status: :created, location: @user}
            else
                format.html {render action: 'new'}
                format.json {render json: @user.errors, status: :unprocessable_entity}
            end
        end
    end

    def database_contents
        @users = User.all
    end

    private
    def user_params
        params.require(:user).permit(:name,:email)
    end
end

# result = ApiHandlerService.execute
#         if result.success?
#             render json: { }
#         else
#             render json: { }
#         end
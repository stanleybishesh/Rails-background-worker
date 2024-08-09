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
        @user = User.new(name: params[:name], email: params[:email])
        @user.save
        redirect_to users_path
    end

    def database_contents
        @users = User.all
    end
end

# result = ApiHandlerService.execute
#         if result.success?
#             render json: { }
#         else
#             render json: { }
#         end
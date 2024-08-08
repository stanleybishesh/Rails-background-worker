# require 'rest-client'

class UsersController < ApplicationController
    URL = "https://jsonplaceholder.typicode.com/users"

    def index
        @data = JSON.parse(ApiHandlerService.execute)
        HelloNameJob.perform_async("Bishesh", 5)
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(name: params[:name], email: params[:email])
        if @user.save
            redirect_to root_path
        else
            render root_path
        end
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
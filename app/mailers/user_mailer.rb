class UserMailer < ApplicationMailer
    default from: 'bishesh.shrestha@fleetpanda.com'

    def hello_email
        @user = params[:user]
        @url = "https://stanleybishesh.github.io/Fleet-Project/"
        mail(to: @user.email, subject: "Please feel free to user my test website")
    end
end

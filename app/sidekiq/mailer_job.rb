require 'sidekiq-scheduler'

class MailerJob
    include Sidekiq::Worker

    def perform
        data = User.all
        data.each do |user|
            UserMailer.hello_email(user).deliver_now
        end
    end     
end
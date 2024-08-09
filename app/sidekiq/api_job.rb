require 'sidekiq-scheduler'

class ApiJob
  include Sidekiq::Worker

#   sidekiq_options queue: 'apis'

  def perform
    data = JSON.parse(ApiHandler.execute)
    data.map do |user|
        User.create(name: user['name'], email: user['email'])
    end
  end
end

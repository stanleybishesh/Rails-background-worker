require 'sidekiq-scheduler'

class ApiJob
  include Sidekiq::Job

  sidekiq_options queue: 'apis'

  def perform(*args)

  end
end

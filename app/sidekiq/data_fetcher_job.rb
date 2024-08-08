require 'sidekiq-scheduler'

class DataFetcherJob
  include Sidekiq::Job

  def perform(*args)

  end
end

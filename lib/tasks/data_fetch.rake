namespace :fetcher do
    desc "Fetched data are saved to database."

    task save: :environment do
        ApiJob.perform_async
    end
end
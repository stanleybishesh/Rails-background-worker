require 'sidekiq'

class HelloNameJob 
    include Sidekiq::Job

    def perform(name,count)
        count.times do 
            puts "Hello #{name}!"
        end
    end 
end

# HelloNameJob.perform("Bishesh",5)
# HelloNameJob.perform_in(5.minutes, "Bishesh", 5)
# HelloNameJob.perform_at(2.days.from_now, "Bishesh", 5)
class ApiHandlerService
    URL = "https://jsonplaceholder.typicode.com/users"

    def self.execute
        RestClient.get(URL)
    end

    def self.save
        @data = JSON.parse(@responses.body)
        @data.each do |user|
            @post = User.create(name: user['name'], email:user['email']);
            @post.save
        end
    end

end

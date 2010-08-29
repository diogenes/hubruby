require 'ostruct'

module GitHub
  class User < OpenStruct
    def self.from_json(json)
      new(json)
    end

    def self.users_from_json(json)
      json.inject([]) do |users, username|
        users << from_json(:username => username)
      end
    end

    def following
      @following ||= GitHub.following(self.username)
    end

    def followers
      @followers ||= GitHub.followers(self.username)
    end

    def repositories
      @repositories ||= GitHub.repositories(self.username)
    end
  end
end

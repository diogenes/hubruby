require 'ostruct'

module GitHub
  class User < OpenStruct
    def self.from_json(json)
      new(json)
    end

    def self.users_from_json(json)
      json.inject([]) do |users, login|
        users << from_json(:login => login)
      end
    end

    def following
      @following ||= GitHub.following(self.login)
    end

    def followers
      @followers ||= GitHub.followers(self.login)
    end

    def repositories
      @repositories ||= GitHub.repositories(self.login)
    end

    def watched
      @watched ||= GitHub.watched(self.login)
    end
  end
end

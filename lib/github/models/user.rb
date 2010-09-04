require 'ostruct'

module GitHub
  class User < OpenStruct
    def self.from_hash(h)
      new(h)
    end

    def self.users_from_logins(logins)
      logins.inject([]) do |users, login|
        users << from_hash(:login => login)
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

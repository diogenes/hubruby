require 'github/models/base_model'

module GitHub
  class User < BaseModel
    def self.users_from_logins(logins)
      logins.map { |l| from_hash(:login => l) }
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

    def organizations
      @organizations ||= GitHub.user_organizations(self.login)
    end
  end
end

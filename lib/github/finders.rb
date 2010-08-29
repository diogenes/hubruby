module GitHub
  module Finders
    def user(username)
      j = json("/user/show/#{username}", :user)
      User.from_json(j)
    end

    def following(username)
      j = json("/user/show/#{username}/following", :users)
      User.users_from_json(j)
    end

    def followers(username)
      j = json("/user/show/#{username}/followers", :users)
      User.users_from_json(j)
    end

    def repositories(username)
      j = json("/repos/show/#{username}", :repositories)
      Repository.repositories_from_json(j)
    end

    def watched(username)
      j = json("/repos/watched/#{username}", :repositories)
      Repository.repositories_from_json(j)
    end

    def repository(username, repository_name)
      j = json("/repos/show/#{username}/#{repository_name}", :repository)
      Repository.from_json(j)
    end

    def branches(username, repository_name)
      json("/repos/show/#{username}/#{repository_name}/branches", :branches)
    end

    def network(username, repository_name)
      j = json("/repos/show/#{username}/#{repository_name}/network", :network)
      Repository.repositories_from_json(j)
    end

    private

    def json(path, resource)
      response = HTTParty.get('https://github.com/api/v2/json' << path).parsed_response
      response[resource.to_s]
    end
  end # Finders
end # GitHub

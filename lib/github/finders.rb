module GitHub
  module Finders
    def user(login)
      j = json("/user/show/#{login}", :user)
      User.from_hash(j)
    end

    def following(login)
      l = json("/user/show/#{login}/following", :users)
      User.users_from_logins(l)
    end

    def followers(login)
      l = json("/user/show/#{login}/followers", :users)
      User.users_from_logins(l)
    end

    def repositories(login)
      j = json("/repos/show/#{login}", :repositories)
      Repository.repositories_from_hashes(j)
    end

    def watched(login)
      j = json("/repos/watched/#{login}", :repositories)
      Repository.repositories_from_hashes(j)
    end

    def repository(login, repository_name)
      j = json("/repos/show/#{login}/#{repository_name}", :repository)
      Repository.from_hash(j)
    end

    def branches(login, repository_name)
      json("/repos/show/#{login}/#{repository_name}/branches", :branches)
    end

    def network(login, repository_name)
      j = json("/repos/show/#{login}/#{repository_name}/network", :network)
      Repository.repositories_from_hashes(j)
    end

    def commits(login, repository_name, branch = 'master')
      h = json("/commits/list/#{login}/#{repository_name}/#{branch}", :commits)
      Commit.commits_from_hashes(h, Repository.new(:owner => login, :name => repository_name))
    end

    def commit(login, repository_name, commit_id)
      h = json("/commits/show/#{login}/#{repository_name}/#{commit_id}", :commit)
      Commit.from_hash(h, Repository.new(:owner => login, :name => repository_name))
    end

    def user_organizations(login)
      h = json("/user/show/#{login}/organizations", :organizations)
      h.collect{|o| Organization.from_hash(o) }
    end

    def organization_public_repositories(organization_name)
      h = json("/organizations/#{organization_name}/public_repositories", :repositories)
      h.collect{|r| Repository.from_hash(r) }
    end

    def organization_public_members(organization_name)
      h = json("/organizations/#{organization_name}/public_members", :users)
      h.collect{|u| User.from_hash(u) }
    end

    private

    def json(path, resource)
      response = HTTParty.get('https://github.com/api/v2/json' << path).parsed_response
      response[resource.to_s]
    end
  end # Finders
end # GitHub

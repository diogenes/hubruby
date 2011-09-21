module GitHub
  module DSL
    def user(login)
      j = json("/users/#{login}")
      User.from_hash(j)
    end

    def following(login)
      l = json("/users/#{login}/following")
      User.users_from_logins(l)
    end

    def followers(login)
      l = json("/users/#{login}/followers")
      User.users_from_logins(l)
    end

    def repositories(login)
      j = json("/users/#{login}/repos")
      Repository.repositories_from_hashes(j)
    end

    def watched(login)
      j = json("/users/#{login}/watched")
      Repository.repositories_from_hashes(j)
    end

    def repository(login, repository_name)
      j = json("/repos/#{login}/#{repository_name}")
      Repository.from_hash(j)
    end

    def branches(login, repository_name)
      json("/repos/#{login}/#{repository_name}/branches")
    end

    def forks(login, repository_name)
      j = json("/repos/#{login}/#{repository_name}/forks")
      Repository.repositories_from_hashes(j)
    end

    def commits(login, repository_name, branch = 'master')
      h = json("/repos/#{login}/#{repository_name}/commits/#{branch}")
      Commit.commits_from_hashes(h, Repository.new(:owner => login, :name => repository_name))
    end

    def commit(login, repository_name, commit_id)
      h = json("/repos/#{login}/#{repository_name}/commits/#{commit_id}")
      Commit.from_hash(h, Repository.new(:owner => login, :name => repository_name))
    end

    def user_organizations(login)
      h = json("/users/#{login}/orgs")
      h.map {|o| Organization.from_hash(o) }
    end

    def organization_public_repositories(organization_name)
      h = json("/orgs/#{organization_name}/repos")
      h.map {|r| Repository.from_hash(r) }
    end

    def organization_public_members(organization_name)
      h = json("/orgs/#{organization_name}/members")
      h.map {|u| User.from_hash(u) }
    end

    private

    def json(path)
      HTTParty.get('https://api.github.com' << path).parsed_response
    end
  end # Finders
end # GitHub

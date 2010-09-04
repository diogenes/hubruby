require 'ostruct'

module GitHub
  class Repository < OpenStruct
    def self.from_hash(h)
      new(h)
    end

    def self.repositories_from_json(json)
      json.inject([]) do |repositories, repository_json|
        repositories << from_hash(repository_json)
      end
    end

    def branches
      @branches ||= GitHub.branches(self.owner, self.name)
    end

    def network
      @network ||= GitHub.network(self.owner, self.name)
    end
  end
end

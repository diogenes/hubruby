require 'ostruct'

module GitHub
  class Repository < OpenStruct
    def self.from_json(json)
      new(json)
    end

    def self.repositories_from_json(json)
      json.inject([]) do |repositories, repository_json|
        repositories << from_json(repository_json)
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

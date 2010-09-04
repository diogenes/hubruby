require 'ostruct'

module GitHub
  class Repository < OpenStruct
    def self.from_hash(h)
      new(h)
    end

    def self.repositories_from_hashes(h)
      h.inject([]) do |repositories, repository_attrs|
        repositories << from_hash(repository_attrs)
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

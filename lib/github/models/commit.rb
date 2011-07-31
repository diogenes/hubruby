require 'github/models/base_model'

module GitHub
  class Commit < BaseModel
    def initialize(repository = nil, attrs = nil)
      super(attrs)
      self.repository = repository
    end

    def self.from_hash(h, repository)
      new(repository, h)
    end

    def self.commits_from_hashes(h, repository)
      h.map { |commit_attrs| from_hash(commit_attrs, repository) }
    end

    def id
      @table[:id]
    end

    def committer
      User.from_hash(@table[:committer]) if @table[:committer]
    end

    def author
      User.from_hash(@table[:author]) if @table[:author]
    end

    def parents
      @parents ||= @table[:parents].map do |parent_attrs|
        repository.commit(parent_attrs['id'])
      end
    end
  end
end

require 'ostruct'

module GitHub
  class Commit < OpenStruct
    def self.from_hash(h)
      new(h)
    end

    def self.commits_from_hashes(h)
      h.inject([]) do |commits, commit_attrs|
        commits << from_hash(commit_attrs)
      end
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
  end # User
end

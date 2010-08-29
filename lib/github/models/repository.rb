require 'ostruct'

module GitHub
  class Repository < OpenStruct
    def self.from_json(json)
      new(json)
    end
  end
end

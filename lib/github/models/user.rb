require 'ostruct'

module GitHub
  class User < OpenStruct
    def self.from_json(json)
      new(json['user'])
    end
  end
end

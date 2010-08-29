require 'ostruct'

module GitHub
  class User < OpenStruct
    def self.from_json(json)
      new(json)
    end

    def self.users_from_json(json)
      json.inject([]) do |users, username|
        users << from_json(:username => username)
      end
    end
  end
end

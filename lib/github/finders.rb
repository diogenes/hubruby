module GitHub
  module Finders
    def user(username)
      j = json("/user/show/#{username}", :user)
      User.from_json(j)
    end

    private

    def json(path, resource)
      response = HTTParty.get('https://github.com/api/v2/json' << path).parsed_response
      response[resource.to_s]
    end
  end # Finders
end # GitHub

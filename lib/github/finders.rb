module GitHub
  module Finders

    def user(username)
      response = json("/user/show/#{username}")
      User.from_json(response)
    end

    private

    def json(path)
      HTTParty.get('https://github.com/api/v2/json' << path).parsed_response
    end

  end # Finders
end # GitHub

require 'github/models/base_model'

module GitHub
  class Gist < BaseModel
    def owner
      @owner ||= GitHub::User.new(@table[:user])
    end
  end
end

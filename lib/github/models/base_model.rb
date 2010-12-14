require 'ostruct'

module GitHub
  class BaseModel < OpenStruct
    def self.from_hash(h)
      new(h)
    end
  end
end

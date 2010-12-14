require 'ostruct'

module GitHub
  class Organization < OpenStruct
    def self.from_hash(h)
      new(h)
    end
  end
end

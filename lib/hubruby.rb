$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'httparty'

module Hubruby
  VERSION = '0.0.4'

  def self.require_all
    Dir[File.join(File.dirname(__FILE__), %W(github ** *.rb))].each do |f|
      require f
    end
  end

  def self.init
    require_all
  end
end

Hubruby.init

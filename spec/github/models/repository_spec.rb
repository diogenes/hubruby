require 'spec_helper.rb'

describe GitHub::Repository do
  it "should be instantiable from a hash" do
    subject.class.should respond_to(:from_hash)

    hash = {:name => 'hubruby', :owner => 'diogenes'}

    repo = GitHub::Repository.from_hash(hash)
    repo.name.should be_eql 'hubruby'
  end

  it "should be instantiable as a collection from a hash" do
    subject.class.should respond_to(:repositories_from_hashes)
  end

  it "should be able to show your branches" do
    subject.should respond_to(:branches)
  end

  it "should be able to show your network" do
    subject.should respond_to(:network)
  end
end

require 'spec_helper.rb'

describe GitHub::Commit do
  it "should be instantiable from a hash" do
    subject.class.should respond_to(:from_hash)
  end

  it "should be instantiable as a collection from a list of hashes" do
    subject.class.should respond_to(:commits_from_hashes)
  end

  it "should be able to show your commit id" do
    subject.should respond_to(:id)
  end

  it "should be able to show your commiter" do
    subject.should respond_to(:committer)
  end

  it "should be able to show your author" do
    subject.should respond_to(:author)
  end
end

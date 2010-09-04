require 'spec_helper.rb'

describe GitHub do
  it "should be able to find a user" do
    subject.should respond_to(:user)
  end

  it "should be able to find the following users from a user" do
    subject.should respond_to(:following)
  end

  it "should be able to find an user followers" do
    subject.should respond_to(:followers)
  end

  it "should be able to find an user repositories" do
    subject.should respond_to(:repositories)
  end

  it "should be able to find an user watched repositories" do
    subject.should respond_to(:watched)
  end

  it "should be able to find a repository" do
    subject.should respond_to(:repository)
  end

  it "should be able to find the branches of a repository" do
    subject.should respond_to(:branches)
  end

  it "should be able to find the network of a repository" do
    subject.should respond_to(:network)
  end
end

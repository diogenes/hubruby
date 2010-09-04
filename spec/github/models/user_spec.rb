require 'spec_helper.rb'

describe GitHub::User do
  it "should be instantiable from a hash" do
    subject.class.should respond_to(:from_hash)

    hash = {:name => 'Diógenes Falcão', :login => 'diogenes'}

    user = GitHub::User.from_hash(hash)
    user.login.should be_eql "diogenes"
  end

  it "should be instantiable as a collection from a list of logins" do
    subject.class.should respond_to(:users_from_logins)

    logins = ['guy1', 'guy2']

    users = GitHub::User.users_from_logins(logins)
    users.first.login.should be_eql 'guy1'
    users.last.login.should be_eql 'guy2'
    users.size.should be_eql 2
  end

  it "should be able to show your following users" do
    subject.should respond_to(:following)
  end

  it "should be able to show your followers users" do
    subject.should respond_to(:followers)
  end

  it "should be able to show your repositories" do
    subject.should respond_to(:repositories)
  end

  it "should be able to show your watched repositories" do
    subject.should respond_to(:watched)
  end
end

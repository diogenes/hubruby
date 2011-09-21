# encoding: utf-8
require 'spec_helper.rb'

describe GitHub::User do
  subject { GitHub::User.new(:login => 'diogenes') }

  it 'should be instantiable from a hash' do
    h = {:name => 'Diógenes Falcão', :login => 'diogenes'}

    user = GitHub::User.from_hash(h)
    user.login.should be_eql 'diogenes'
  end

  it 'should be instantiable from a list of logins' do
    users = GitHub::User.users_from_logins(['guy1', 'guy2'])
    users.should have(2).users
  end

  it 'should be able to show its following users' do
    subject.following.should_not be_empty
  end

  it 'should be able to show its followers users' do
    subject.followers.should_not be_empty
  end

  it 'should be able to show its repositories' do
    subject.repositories.should_not be_empty
  end

  it 'should be able to show its watched repositories' do
    subject.watched.should_not be_empty
  end
end

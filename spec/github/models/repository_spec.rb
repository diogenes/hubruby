require 'spec_helper.rb'

describe GitHub::Repository do
  subject { GitHub::Repository.new(:name => 'hubruby', :owner => 'diogenes') }

  it "can be instantiated from a hash" do
    hash = {:name => 'hubruby', :owner => 'diogenes'}

    repo = GitHub::Repository.from_hash(hash)
    repo.name.should be_eql 'hubruby'
  end

  it "should be instantiable from a hash collection" do
    h = [
      {:name => 'hubruby', :owner => 'diogenes'},
      {:name => 'coletivo', :owner => 'diogenes'}
    ]

    repos = GitHub::Repository.repositories_from_hashes(h)
    repos.should have(2).repositories
  end

  it "can show its branches" do
    subject.branches.should_not be_empty
  end

  it "can show its forks" do
    subject.forks.should_not be_empty
  end

  it "should be able to find a commit by id" do
    initial_commit_id = '1ec7f79c34e3008e93b7b9210282a743f83db86d'
    subject.commit(initial_commit_id).should_not be_nil
  end
end

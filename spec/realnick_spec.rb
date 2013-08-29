require 'spec_helper'
require 'realnick'

describe Realnick do

  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  it "should raise error when method is not valid" do
    expect {
      Realnick.fetch(:method => 'I am not a valid method')
    }.to raise_error(ArgumentError)
  end

  it "should return a valid nick" do
    Realnick.fetch.first.should be_an_instance_of(String)
  end

  it "should work with method popular_anime" do
    Realnick.fetch('popular_anime').first.should be_an_instance_of(String)
  end

  it "should work with method top_anime" do
    Realnick.fetch('top_anime').first.should be_an_instance_of(String)
  end

  it "should work with method upcoming_anime" do
    Realnick.fetch('upcoming_anime').first.should be_an_instance_of(String)
  end

end

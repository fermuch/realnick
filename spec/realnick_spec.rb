require 'spec_helper'
require 'realnick'

describe Realnick do
  
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  it "should raise error when method is not valid on fetch" do
    expect {
      Realnick.fetch(:method => 'I am not a valid method')
    }.to raise_error(ArgumentError)
  end

end

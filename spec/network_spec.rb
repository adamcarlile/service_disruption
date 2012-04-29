require 'spec_helper'

describe "Service Disruption / Network" do

  before(:each) do
    @network = ServiceDisruption::Network.new(ServiceDisruption.data_source)
  end

  it "should return a list of available lines" do
    @network.lines.should_not be_empty
  end

  it "should allow me to find lines by position" do
    @network[0].class.should eq(ServiceDisruption::Line)
  end

  it "should allow me to find lines by name" do
    @network.find_by_name('Bakerloo').should_not be_empty
  end

  it "should allow me to find lines by id" do
    @network.find_by_id('1').should_not be_empty
  end

  it "should be able to update it's list" do
    old_time = @network.updated_at
    @network.update!
    @network.updated_at.should_not eq(old_time)
  end

end

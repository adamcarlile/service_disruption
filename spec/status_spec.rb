require 'spec_helper'

describe "Service Disruption / Status" do

  before(:all) do
    @good_status = {
        :id => "GS",
        :description => "Good Service",
        :is_active => true
      }
    @severe_delays = {
      :id => "SD",
      :description => "Severe Delays",
      :is_active => true
    }
  end

  context "Status with good service" do
    before(:each) do
      @status = ServiceDisruption::Status.new(@good_status, "Everything is running great")
    end

    it "shouldn't be disrupted" do
      @status.disrupted?.should be_false
    end

  end

  context "Status with severe delays" do
    before(:each) do
      @status = ServiceDisruption::Status.new(@severe_delays, "It's all horribly broken")
    end

    it "should be disrupted" do
      @status.disrupted?.should be_true
    end

  end

  it "should be equal when two statuses with the same attributes are compared" do
    status = ServiceDisruption::Status.new(@good_status, "It's going great")
    status.should == status
  end

  it "shouldn't be equal when two statuses with the same attributes are compared" do
    good_status = ServiceDisruption::Status.new(@good_status, "It's going great")
    bad_status = ServiceDisruption::Status.new(@severe_delays, "Oh dear")
    good_status.should_not == bad_status
  end

end

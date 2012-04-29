require 'spec_helper'

describe "Service Disruption / Line" do

  before(:all) do
    @bakerloo = {
      :line => {:id => "1", :name => "Bakerloo"},
      :status => {
        :id => "GS",
        :description => "Good Service",
        :is_active => true
      },
      :status_details => ""
    }
  end

  context "Line with good service" do

    before(:each) do
      @line = ServiceDisruption::Line.new(@bakerloo)
    end

    it "should not be disrupted" do
      @line.disrupted?.should be_false
    end

    it "should return it's name and status" do
      @line.to_s.should be_an_instance_of String
    end

  end

  context "Line with minor disruptions" do

    before(:each) do
      @broken_bakerloo = @bakerloo.merge({
        :status_details => "Oops, looks like the Bakerloo line is broken again",
        :status => {
          :id => "MD",
          :description => "Minor Delays"
        }})
      @line = ServiceDisruption::Line.new(@broken_bakerloo)
    end

    it "should be disrupted" do
      @line.disrupted?.should be_true
    end

    it "should allow me to change the lines status" do
      @line.disrupted?.should be_true
      @line.update_status(@bakerloo)
      @line.disrupted?.should be_false
    end

    it "shouldn't create a new status object if the line status hasn't changed" do
      old_status = @line.status
      @line.update_status(@broken_bakerloo)
      @line.status.object_id.should eq(old_status.object_id)
    end

  end

end

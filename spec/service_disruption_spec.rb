require 'spec_helper'

describe "Service Disruption" do

  it "should return a network object" do
    ServiceDisruption.network.class.should eq(ServiceDisruption::Network)
  end

  it "should return a datasource" do
    ServiceDisruption.data_source.class.should eq(ServiceDisruption::DataSource)
  end

end

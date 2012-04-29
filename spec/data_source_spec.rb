require 'spec_helper'

describe "Service Disruption / Data Source" do

  context 'with a successful HTTP request' do

    before(:each) do
      @data_source = ServiceDisruption::DataSource.new(ServiceDisruption::TFL_ENDPOINT)
    end

    it 'should return an array of available lines' do
      @data_source.available_lines.class.should eq(Array)
    end

    it 'should return an aray with more then one line' do
      @data_source.available_lines.should_not be_empty
    end

  end

  context 'with an unsuccessful HTTP request' do

    before(:each) do
      @data_source = ServiceDisruption::DataSource.new('http://cloud.tfl.gov.uk/unsuccessful.xml')
    end

    it 'should return an empty array' do
      @data_source.available_lines.should be_empty
    end

  end

end

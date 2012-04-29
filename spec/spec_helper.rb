$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'service_disruption'
require 'fakeweb'


RSpec.configure do |config|
  config.before(:suite) do
    FakeWeb.allow_net_connect = false

    FakeWeb.register_uri(:get, ServiceDisruption::TFL_ENDPOINT,
      :body => File.read(File.join(File.dirname(__FILE__), 'fixtures', 'line_status.xml')),
      :content_type => "text/xml")

    FakeWeb.register_uri(:get, 'http://cloud.tfl.gov.uk/unsuccessful.xml',
      :status => ['500', 'Internal Server Error'])
  end
end

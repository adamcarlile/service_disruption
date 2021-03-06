begin
  require 'rubygems'
rescue LoadError
end

require 'uri'
require 'thor'
require 'httparty'
require 'eventmachine'
require 'daemons'
require 'rainbow'
require 'ruby_gntp'
require 'terminal-notifier'
require 'active_support/core_ext'

#Redefine runtime loadpath
$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require "service_disruption/command"
require "service_disruption/data_source"
require "service_disruption/line"
require "service_disruption/status"
require "service_disruption/network"
require "service_disruption/notifiers/growl"
require "service_disruption/notifiers/notification_center"

require "service_disruption/core_ext/hash"

module ServiceDisruption
  VERSION = '1.0.0'
  TFL_ENDPOINT = 'http://cloud.tfl.gov.uk/TrackerNet/LineStatus'
  ROOT_PATH = File.dirname(File.dirname(__FILE__))

  extend self

  def notifier
    @notifier ||= ServiceDisruption::Notifiers::NotificationCenter.new
  end

  def data_source
    @data_source ||= ServiceDisruption::DataSource.new(TFL_ENDPOINT)
  end

  def network
    @network ||= ServiceDisruption::Network.new(data_source)
  end

end

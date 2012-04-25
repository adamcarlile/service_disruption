#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'service_disruption'

ServiceDisruption::Command.start

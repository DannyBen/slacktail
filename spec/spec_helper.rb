require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'mister_bin'
requires 'mocks'

include Slacktail
require_relative 'spec_mixin'

# Consistent Colsole output (for rspec_fixtures)
ENV['TTY'] = 'on'

ORIGINAL_SLACK_API_TOKEN = ENV['SLACK_API_TOKEN']

RSpec.configure do |c|
  c.include SpecMixin

  # Do not run specs marked with :local in CI
  c.filter_run_excluding :local if ENV['CI']
end

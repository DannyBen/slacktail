lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slacktail/version'

Gem::Specification.new do |s|
  s.name        = 'slacktail'
  s.version     = Slacktail::VERSION
  s.summary     = "Command line utility for following your Slack chat from the terminal"
  s.description = "Slacktail is a single-purpose command line utility for following messages sent to your Slack organization chat."
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.executables = ['slacktail']
  s.homepage    = 'https://github.com/dannyben/slacktail'
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.7.0"

  s.add_runtime_dependency 'mister_bin', '~> 0.7'
  s.add_runtime_dependency 'colsole', '~> 0.8', '>= 0.8.1'
  s.add_runtime_dependency 'requires', '~> 1.0'
  s.add_runtime_dependency 'slack-ruby-client', '~> 2.0', '< 2.1'

  # Other versions are incompatible
  s.add_runtime_dependency 'async-websocket', '~> 0.8.0'
end

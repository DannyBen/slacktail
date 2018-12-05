require 'requires'
require 'mister_bin'
require 'slack-ruby-client'
require 'byebug' if ENV['BYEBUG']

requires \
  'slacktail/base',
  'slacktail/message_view',
  'slacktail/has_text',
  'slacktail/has_client',
  'slacktail'


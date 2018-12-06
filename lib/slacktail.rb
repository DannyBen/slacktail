require 'requires'
require 'mister_bin'
require 'slack-ruby-client'
require 'tty-markdown'
require 'byebug' if ENV['BYEBUG']

requires \
  'slacktail/has_client',
  'slacktail/base',
  'slacktail/message_view',
  'slacktail/has_text',
  'slacktail/version',
  'slacktail'


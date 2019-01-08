Slacktail
==================================================

[![Gem Version](https://badge.fury.io/rb/slacktail.svg)](https://badge.fury.io/rb/slacktail)
[![Build Status](https://travis-ci.com/DannyBen/slacktail.svg?branch=master)](https://travis-ci.com/DannyBen/slacktail)
[![Maintainability](https://api.codeclimate.com/v1/badges/c81fe947a0e4b5bd1bdc/maintainability)](https://codeclimate.com/github/DannyBen/slacktail/maintainability)

Slacktail is a single-purpose command line utility for following messages 
sent to your Slack organization chat.


Demo
--------------------------------------------------

![Demo](https://raw.githubusercontent.com/DannyBen/slacktail/master/demo.gif)


Installation
--------------------------------------------------

    $ gem install slacktail


Authorization
--------------------------------------------------


1. Obtain an API key from Slack.
   In your Slack settings, go to [Custom Integrations] and create a new 
   Bot Application. Then, find the API Token in the bot's configuration page.  

2. Set the `SLACK_API_TOKEN` environemnt variable to the API Token. This 
   should probably be set in your `~/.bashrc`, with 
   `export SLACK_API_TOKEN=<your token>`

3. Invite your bot to any channel you want to monitor. Type 
   `/invite @<botname>` in any channel.


Usage
--------------------------------------------------

Follow all channels:

    $ slacktail

Follow specific channels:
    
    $ slacktail general development lobby

Full Usage Help:

    $ slacktail --help
    Show and follow slack messages in real time

    Usage:
      slacktail [CHANNELS...]
      slacktail (-h|--help|--version)

    Options:
      -h --help
        Show this help

      --version
        Show version number

    Parameters:
      CHANNELS
        Channels to follow

    Examples:
      slacktail
      slacktail general debug


---

[Custom Integrations]: https://my.slack.com/apps/manage/custom-integrations

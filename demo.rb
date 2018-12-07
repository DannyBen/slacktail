help   "Simulated run for recording the demo"
action :demo do |args|
  client = Mocks::Client.new echo: false
  Client.default = client
  Command.new.run
  
  sleep 2
  mock = Mocks::Message.new(attachments: false, message: "I’ll never turn to the dark side. You’ve failed, your highness. I am a Jedi, like my father before me.")
  client.simulate :message, mock
  
  sleep 2
  mock = Mocks::Message.new(message2: '', user: :bot, color: 'ffff00', message: "*Build started* some.production.service.com")
  client.simulate :message, mock
  
  sleep 4
  mock = Mocks::Message.new(message2: '', user: :bot, color: 'ff0000', message: "**Build FAILED**:\n\nBuild number `45` failed in `production`")
  client.simulate :message, mock

  sleep 6
  mock = Mocks::Message.new(attachments: false, message: "Fixed, deploying again")
  client.simulate :message, mock
  
  sleep 3
  mock = Mocks::Message.new(message2: '', user: :bot, color: 'ffff00', message: "*Build started* some.production.service.com")
  client.simulate :message, mock
  
  sleep 4
  mock = Mocks::Message.new(message2: '', user: :bot, color: '00ff00', message: "**Build SUCCEEDED**:\n\nBuild number `45` deployed to `production`")
  client.simulate :message, mock

  sleep 10
end
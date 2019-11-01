module Commands
  # Command Module
  module Guild
    extend Discordrb::Commands::CommandContainer
    command(
      [:guildroles, :gr],
      description: 'Displays guild roles set up for the server.',
      usage: 'guildroles'
    ) do |event|
      if $guilds.key?(event.server.id.to_s)
        output = ''
        $guilds[event.server.id.to_s].each { |x| output += "#{x['name']}\n" }
        e = embed('Guild roles currently set up:', output)
        event.channel.send_embed '', e
      else
        event.respond 'This server does not have any joinable guild roles.'
      end
      command_log('guildroles', event.user.name)
      nil
    end
  end
end

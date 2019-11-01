# Adds a role based on who is playing MHO
module Events
  extend Discordrb::EventContainer
  playing do |event|
    server_role = event.server.roles.find { |role| role.name == "Playing MHO" }
    server_user = BOT.member(event.server.id, event.user.id)
    if event.game == "Monster Hunter Online"
      server_user.add_role(server_role) unless server_role.nil?
    else
      unless server_role.nil?
        server_user.remove_role(server_role) if server_user.role?(server_role.id)
      end
    end
  end
end

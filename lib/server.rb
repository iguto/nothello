#!/usr/local/bin/ruby

require 'bundler'
Bundler.require

class OthelloServer < EM::Connection
  # attr_accessor :connections

  @@clients = []

  def post_init
    @@clients.push(self)
    puts "  connected to the server"
  end

  def unbind
    @@clients.delete(self)
  end

  def receive_data(data)
    @@clients.each do |client|
      client.send_data " >>> server send: #{data}"
    end
  end
end

if $0 == __FILE__

  Signal.trap("INT") { EventMachine::stop}
  Signal.trap("TERM") { EventMachine::stop}

  host = "0.0.0.0"
  port = 9999
  EventMachine::run do
    EventMachine::start_server host, port, OthelloServer
    puts "server is listening on #{host}:#{port}"
  end
end

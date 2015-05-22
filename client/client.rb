#!/usr/bin/ruby

require 'ffi-rzmq'

class SubZero

  attr_reader :requester

  def initialize
    host = ARGV.shift
    zmq(host)
    send_word
  end

  def send_word
    requester.send_string ARGV.join(" ")
    reply = ''
    rc = requester.recv_string(reply)
    puts reply
  end

  def zmq(host)
    context = ZMQ::Context.new(1)

    # Socket to talk to server
    puts "Connecting to hello world server…"
    @requester ||= context.socket(ZMQ::REQ)
    requester.connect("tcp://#{host}")
  end
end

SubZero.new

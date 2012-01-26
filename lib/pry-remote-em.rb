require 'pry-remote-em/version'
require 'pry-remote-em/json-proto'
require 'eventmachine'
require 'json'
require "fiber"

module PryRemoteEm
  DEFHOST   = 'localhost'
  DEFPORT   = 6462
  NEGOTIMER = 15
end


class Object
  def remote_pry_em(host = PryRemoteEm::DEFHOST, port = PryRemoteEm::DEFPORT, opts = {:tls => false})
    opts = {:target => self}.merge(opts)
    PryRemoteEm::Server.run(opts[:target], host, port, opts)
  end
end

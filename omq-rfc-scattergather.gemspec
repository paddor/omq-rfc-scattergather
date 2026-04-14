# frozen_string_literal: true

require_relative "lib/omq/rfc/scattergather/version"

Gem::Specification.new do |s|
  s.name        = "omq-rfc-scattergather"
  s.version     = OMQ::RFC::ScatterGather::VERSION
  s.authors     = ["Patrik Wenger"]
  s.email       = ["paddor@gmail.com"]
  s.summary     = "ZMQ SCATTER/GATHER socket types (RFC 49) for OMQ"
  s.description = "SCATTER and GATHER socket types implementing ZeroMQ RFC 49 " \
                  "for the OMQ pure-Ruby ZeroMQ library."
  s.homepage    = "https://github.com/paddor/omq-rfc-scattergather"
  s.license     = "ISC"

  s.required_ruby_version = ">= 3.3"

  s.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]

  s.add_dependency "omq", ">= 0.20"
end

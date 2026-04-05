# frozen_string_literal: true

# OMQ SCATTER/GATHER socket types (ZeroMQ RFC 49).
#
# Usage:
#   require "omq/rfc/scattergather"
#
#   gather  = OMQ::GATHER.bind("tcp://127.0.0.1:5555")
#   scatter = OMQ::SCATTER.connect("tcp://127.0.0.1:5555")

require "omq"

require_relative "scattergather/version"
require_relative "../single_frame"
require_relative "../routing/scatter"
require_relative "../routing/gather"
require_relative "../scatter_gather"

OMQ::Routing.register(:SCATTER, OMQ::Routing::Scatter)
OMQ::Routing.register(:GATHER,  OMQ::Routing::Gather)

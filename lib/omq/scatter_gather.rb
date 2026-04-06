# frozen_string_literal: true

module OMQ
  # Pipeline sender socket that round-robins to GATHER peers (ZeroMQ RFC 49).
  class SCATTER < Socket
    include Writable
    include SingleFrame

    # Creates a new SCATTER socket.
    #
    # @param endpoints [String, Array<String>, nil] endpoint(s) to connect to
    # @param linger [Integer] linger period in milliseconds
    # @param send_hwm [Integer, nil] send high-water mark
    # @param send_timeout [Integer, nil] send timeout in milliseconds
    # @param backend [Object, nil] optional transport backend
    def initialize(endpoints = nil, linger: 0, send_hwm: nil, send_timeout: nil, backend: nil)
      _init_engine(:SCATTER, linger: linger, send_hwm: send_hwm, send_timeout: send_timeout, backend: backend)
      _attach(endpoints, default: :connect)
    end
  end


  # Pipeline receiver socket that fair-queues from SCATTER peers (ZeroMQ RFC 49).
  class GATHER < Socket
    include Readable
    include SingleFrame

    # Creates a new GATHER socket.
    #
    # @param endpoints [String, Array<String>, nil] endpoint(s) to bind to
    # @param linger [Integer] linger period in milliseconds
    # @param recv_hwm [Integer, nil] receive high-water mark
    # @param recv_timeout [Integer, nil] receive timeout in milliseconds
    # @param backend [Object, nil] optional transport backend
    def initialize(endpoints = nil, linger: 0, recv_hwm: nil, recv_timeout: nil, backend: nil)
      _init_engine(:GATHER, linger: linger, recv_hwm: recv_hwm, recv_timeout: recv_timeout, backend: backend)
      _attach(endpoints, default: :bind)
    end
  end
end

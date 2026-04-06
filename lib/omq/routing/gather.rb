# frozen_string_literal: true

module OMQ
  module Routing
    # GATHER socket routing: fair-queue receive from SCATTER peers.
    #
    class Gather
      include FairRecv

      # @param engine [Engine]
      #
      def initialize(engine)
        @engine     = engine
        @recv_queue = FairQueue.new
        @tasks      = []
      end


      # @return [FairQueue]
      #
      attr_reader :recv_queue

      # @param connection [Connection]
      #
      def connection_added(connection)
        add_fair_recv_connection(connection)
      end


      # @param connection [Connection]
      #
      def connection_removed(connection)
        @recv_queue.remove_queue(connection)
      end


      # GATHER is read-only.
      #
      def enqueue(_parts)
        raise "GATHER sockets cannot send"
      end


      # Stops all background tasks.
      def stop
        @tasks.each(&:stop)
        @tasks.clear
      end
    end
  end
end

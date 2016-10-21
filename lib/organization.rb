# frozen_string_literal: true
require_relative 'kktix_api'

module KktixEvent
  # Single organization on KKTIX
  class Organization
    attr_reader :oid

    def initialize(kktix_api, oid)
      @kktix_api = kktix_api
      @oid = oid
    end

    def events
      return @events if @events
      events_hash = @kktix_api.events(@oid)
      return if events_hash.nil?
      @events = events_hash
    end

    def name
      update_info if @name.nil?
      @name
    end

    def uri
      update_info if @uri.nil?
      @uri
    end

    private

    def update_info
      author = events.first['author']
      @name = author['name']
      @uri = author['uri']
    end
  end
end

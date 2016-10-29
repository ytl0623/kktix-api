# frozen_string_literal: true
require_relative 'kktix_api'
require_relative 'event'

module KktixEvent
  # Single organization on KKTIX
  class Organization
    attr_reader :oid, :name, :uri, :events

    def initialize(organization_data, oid: nil)
      update_info(organization_data, oid)
    end

    def self.find(oid = nil)
      organization_data = KktixEvent::KktixApi.events(oid)
      new(organization_data, oid: oid)
    end

    private

    def update_info(entry, oid)
      unless oid.nil?
        author = entry.first['author']
        @oid = oid
        @name = author['name']
        @uri = author['uri']
      end
      @events = entry.map do |event_data|
        KktixEvent::Event.new(event_data)
      end
    end
  end
end

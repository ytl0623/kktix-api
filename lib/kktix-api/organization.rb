# frozen_string_literal: true
require_relative 'kktix_api'
require_relative 'event'

module KktixEvent
  # Single organization on KKTIX
  class Organization
    attr_reader :slug, :name, :uri, :events

    def initialize(organization_data, slug: nil)
      update_info(organization_data, slug)
    end

    def self.find(slug = nil)
      events = KktixEvent::KktixApi.events(slug: slug)
      new(events, slug: slug)
    end

    private

    def update_info(events, slug)
      unless slug.nil?
        author = events.first[:author]
        @slug = slug
        @name = author[:name]
        @uri = author[:uri]
      end
      @events = events.map do |event_data|
        Event.new(event_data)
      end
    end
  end
end

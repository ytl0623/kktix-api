# frozen_string_literal: true
require_relative 'kktix_api'

module KktixEvent
  # Single event on organiztion's feed
  class Event
    attr_reader :url, :title, :summary, :content, :author

    def initialize(event_data)
      load_data(event_data)
    end

    def self.search(query)
      events_hash = KktixApi.search(query)
      events = events_hash.map do |event_hash|
        new(event_hash)
      end
      events
    end

    private

    def load_data(event_data)
      @url = event_data[:url]
      @title = event_data[:title]
      @summary = event_data[:summary]
      @content = event_data[:content]
      @author = event_data[:author]
    end
  end
end

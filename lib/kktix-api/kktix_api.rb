# frozen_string_literal: true
require 'yaml'
require 'http'
require 'open-uri'
require 'nokogiri'
require 'uri'
require 'date'

module KktixEvent
  # Service for retriving KKTIX events
  class KktixApi
    def self.events(slug: nil)
      response = HTTP.get(events_json_uri(slug: slug)).parse
      return hash_s_to_sym(response['entry']) if response.key?('entry')
      []
    end

    def self.search(query, start_at: Date.today)
      start_at = start_at.to_s
      uri = URI.escape("https://kktix.com/events?start_at=#{start_at}search=#{query}")
      doc = Nokogiri::HTML(open(uri))
      parse_search_result(doc)
    end

    def self.events_json_uri(slug: nil)
      return 'https://kktix.com/events.json' if slug.nil?
      "http://#{slug}.kktix.cc/events.json"
    end

    private_class_method

    def self.hash_s_to_sym(obj)
      return obj.map { |hash| hash_s_to_sym(hash) } if obj.class == Array
      obj.each_with_object({}) do |(k, v), memo|
        # if v.class == Array
        v = hash_s_to_sym(v) if v.class == Hash
        memo[k.to_sym] = v
        memo
      end
    end

    def self.parse_search_result(doc)
      events = doc.css('ul.event-list > li').map do |node|
        title, url = parse_title node
        date = node.css('.date').text
        author = parse_author(node)
        summary = node.css('> .description').text

        { url: url, title: title, date: date, summary: summary, author: author }
      end
      events
    end

    def self.parse_title(node)
      title_node = node.css('> h2 > a')
      title = title_node.text.strip
      url = title_node.attr('href').value
      [title, url]
    end

    def self.parse_author(node)
      author_node = node.css('.host')
      name = author_node.text.strip
      uri = author_node.css('> a').attr('href').value
      { name: name, uri: uri }
    end
  end
end

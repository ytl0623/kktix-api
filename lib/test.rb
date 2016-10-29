# frozen_string_literal: true
require_relative 'kktix_api'
require_relative 'organization'

oid = 'nthuion'

acts = KktixEvent::KktixApi.events(oid)
puts acts

organization = KktixEvent::Organization.find(oid)
puts organization.name, organization.uri
organization.events.each do |event|
  puts event.title, event.published
end

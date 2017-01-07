# frozen_string_literal: true
require_relative 'spec_helper.rb'

describe 'Event spec' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock
  end

  before do
    VCR.insert_cassette CASSETTE_FILE, record: :new_episodes
    @organization = KktixEvent::Organization.find(TEST_ORG_SLUG)
  end

  after do
    VCR.eject_cassette
  end

  it 'should be able to search events throuh api' do
    KktixEvent::Event.search('go').wont_be_empty
  end
end

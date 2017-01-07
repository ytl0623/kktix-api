# frozen_string_literal: true
require_relative 'spec_helper.rb'

describe 'Organization spec' do
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

  it 'should be the same oid of the organization' do
    @organization.slug.must_equal TEST_ORG_SLUG
  end

  it 'should be able to get name of the organization' do
    @organization.name.length.must_be :>, 0
  end

  it 'should be able to get uri of the organization' do
    @organization.uri.length.must_be :>, 0
  end

  it 'should be able to get events the organization' do
    @organization.events.wont_be_empty
  end
end

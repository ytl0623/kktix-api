# frozen_string_literal: true
require_relative 'spec_helper.rb'

TEST_ORG_ID = 'nthuion'
# KKTIX_RESPONSE = YAML.load(File.read('spec/fixtures/kktix_response.yml'))
# TEST_ORG_INFO = YAML.load(File.read('spec/fixtures/nthuion_info.yml'))


describe 'KKTIX API spec' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock
  end

  before do
    VCR.insert_cassette CASSETTE_FILE, record: :new_episodes

    @kktix_api = KktixEvent::KktixApi.new
    @organization = KktixEvent::Organization.new(@kktix_api, TEST_ORG_ID)
  end

  after do
    VCR.eject_cassette
  end

  it 'should be able to get title throuh api' do
    @kktix_api.title.length.must_be :>, 0
  end

  it 'should be able to get last updated time throuh api' do
    @kktix_api.updated.length.must_be :>, 0
  end

  it 'should be able to get events information throuh api' do
    @kktix_api.events.wont_be_empty
  end

  it 'should be the same oid of the organization' do
    @organization.oid.must_equal TEST_ORG_ID
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

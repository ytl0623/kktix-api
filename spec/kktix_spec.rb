require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require_relative '../lib/kktix.rb'

test_org = "nthuion"

describe 'KKTIC spec' do

  it 'should be able to get data throuh api' do
    Activities.new.org_acts(test_org).wont_be_empty
  end

  it 'should get the title of the activity' do
    Activities.new.org_acts(test_org)["title"].wont_be_empty
  end

  it 'should get the updated time of the activity' do
    Activities.new.org_acts(test_org)["updated"].wont_be_empty
  end

  it 'should get the entry of the activity' do
    Activities.new.org_acts(test_org)["entry"].wont_be_empty
  end

end
require 'yaml'
require 'http'

# Create API response dump
kktix_response = {}
activity_info = {}

# Find desired org:
# requires org_id: orgs on KKTIX
org_id = %w(nthuion nctu330)

org_id.each do |oid|
  org_response = HTTP.get("http://#{oid}.kktix.cc/events.json")
  kktix_response[:org] = org_response
  activity = JSON.parse(org_response.to_s)
  key_name = oid + '_activity'
  activity_info[key_name.to_sym] = activity
end

File.write('kktix_response.yml', kktix_response.to_yaml)
File.write('activity_info.yml', activity_info.to_yaml)

require 'yaml'
require 'http'

module KKTIX
  class KKTIXApi

    def get_org_acts(oid)
      kktix_response = {}
      org_response = HTTP.get("http://#{oid}.kktix.cc/events.json")
      kktix_response[:org] = org_response
      activity = JSON.parse(org_response.to_s) # hash
    end

  end
end
# frozen_string_literal: true
require_relative 'kktix_api'

module KKTIX
  class Activities
    include KKTIX

    def initialize
      @kktix_api = KKTIX::KKTIXApi.new
    end

    def org_acts(oid)
      acts = @kktix_api.get_org_acts(oid)
    end
  end
end

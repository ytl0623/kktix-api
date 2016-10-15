require_relative 'kktix_api'

class Activities
  include KKTIX

  def initialize
    @kktix_api = KKTIX::KKTIXApi.new
  end

  def org_acts(oid)
    acts = @kktix_api.get_org_acts(oid)
  end
end

# @kktix_api = KKTIX::KKTIXApi.new
# acts = @kktix_api.get_org_acts("nthuion")
# puts acts["title"]


# tmp = Activities.new
# print tmp.org_acts("nthuion")
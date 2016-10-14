require_relative 'kktix_api'


@kktix_api = KKTIX::KKTIXApi.new
acts = @kktix_api.get_org_acts("nthuion")
puts acts
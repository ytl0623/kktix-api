# KKTIX API Gem

[![Gem Version](https://badge.fury.io/rb/kktix_api.svg)](https://badge.fury.io/rb/kktix_api)
[![Build Status](https://travis-ci.org/twentyfour7/kktix-api.svg?branch=master)](https://travis-ci.org/twentyfour7/kktix-api)

kktix_api is a gem that gets event information of an organization from [KKTIX](https://kktix.com)

## Installation

If you are working on a project, add this to your Gemfile: `gem 'kktix_api'`

For ad hoc installation from command line:

```console
$ gem install kktix_api
```
```
C:\Users\ytlGift>gem install kktix_api
Fetching nokogiri-1.16.3-x64-mingw-ucrt.gem
Fetching http_parser.rb-0.6.0.gem
Fetching http-form_data-1.0.3.gem
Fetching domain_name-0.6.20240107.gem
Fetching http-cookie-1.0.5.gem
Fetching public_suffix-5.0.5.gem
Fetching addressable-2.8.6.gem
Fetching http-2.2.2.gem
Fetching kktix_api-1.0.0.gem
Successfully installed nokogiri-1.16.3-x64-mingw-ucrt
Building native extensions. This could take a while...
Successfully installed http_parser.rb-0.6.0
Successfully installed http-form_data-1.0.3
Successfully installed domain_name-0.6.20240107
Successfully installed http-cookie-1.0.5
Successfully installed public_suffix-5.0.5
Successfully installed addressable-2.8.6
Successfully installed http-2.2.2
Successfully installed kktix_api-1.0.0
Parsing documentation for nokogiri-1.16.3-x64-mingw-ucrt
Installing ri documentation for nokogiri-1.16.3-x64-mingw-ucrt
Parsing documentation for http_parser.rb-0.6.0
unknown encoding name "chunked\r\n\r\n25" for ext/ruby_http_parser/vendor/http-parser-java/tools/parse_tests.rb, skipping
Installing ri documentation for http_parser.rb-0.6.0
Parsing documentation for http-form_data-1.0.3
Installing ri documentation for http-form_data-1.0.3
Parsing documentation for domain_name-0.6.20240107
Installing ri documentation for domain_name-0.6.20240107
Parsing documentation for http-cookie-1.0.5
Installing ri documentation for http-cookie-1.0.5
Parsing documentation for public_suffix-5.0.5
Installing ri documentation for public_suffix-5.0.5
Parsing documentation for addressable-2.8.6
Installing ri documentation for addressable-2.8.6
Parsing documentation for http-2.2.2
Installing ri documentation for http-2.2.2
Parsing documentation for kktix_api-1.0.0
Installing ri documentation for kktix_api-1.0.0
Done installing documentation for nokogiri, http_parser.rb, http-form_data, domain_name, http-cookie, public_suffix, addressable, http, kktix_api after 6 seconds
9 gems installed

A new release of RubyGems is available: 3.4.19 → 3.5.7!
Run `gem update --system 3.5.7` to update your installation.
```

## Usage

Execute `kktix` of an organization with specific `organization_id`; Otherwise, get latest published events.
```console
$ kktix [org_id]
```

### API

Require kktix_api gem in your code:

```ruby
require 'kktix_api'
```

Get information using domain class `Organization`, you can get attributes like `name`, `uri`, and all the `events` held by the organization.

```ruby
organization = KktixEvent::Organization.find('<organization_id>')
```


List events information from an `Organization`, including `url`, `published`, `title`,  `summary`, `content`, and `author`.

```ruby
organization.events.each do |event|
  puts "#{event.title} (#{event.published})"
  puts event.url
  puts event.content
  puts
end
```

See the following example code for more usage details:

```ruby
oid = 'nthuion'

acts = KktixEvent::KktixApi.events(oid)
puts acts

organization = KktixEvent::Organization.find(oid)
puts organization.name, organization.uri
organization.events.each do |event|
  puts event.title, event.published
end

```

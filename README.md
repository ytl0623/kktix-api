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

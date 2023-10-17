eBay API Client for Ruby
========================

[![Build Status](https://travis-ci.com/veeqo/ebay.svg?branch=master)](https://travis-ci.com/veeqo/ebay)
========================

The api implements the ebay Trading API. To get a list of calls look here:
http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/index.html

or

lib/ebay/api_methods.rb


Some key features:

* Simple and easy to use Ruby implementation.
* Ability to return a raw response for calls that return an extremely large response such as GetCategoriesRequest.
* Up-to-date with the eBay API, see /lib/ebay/schema/version.rb
* Months of usage in a production environment.
* Support for Platform Notifications baked right in.


For examples of many common tasks see the examples folder. Start with get_ebay_time.rb.
You need to get a develper account and place a config.rb (see template) in the
examples directory.

## API Version and Schema Updates

Please follow this steps whenever you need to update API version and
corresponding scheme.

    rake schema:update
    rake classes:generate
    rake test

**Maintainers Note:** Each schema update must be tagged `schema-vXXX` where
`XXX` is schema version.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ebay', github: 'veeqo/ebay'
```

And then execute:

    $ bundle

## Request events

The gem fires ASN event on every request to eBay API.

Default event name is `ebay_trading_api.request.details`.

Event payload is a Hash which contains the following data:
- `:api_endpoint` -- call name, i.e. 'GeteBayOfficialTime'
- `:api_version` -- API schema version, i.e. '1211'
- `:method` -- request method, always 'post' as no other is used
- `:request_context` -- a Hash with additional request context, by default contains `site_id`,
- `:response` _(optional)_ -- contains a response object type of `Ebay::Response`; exists only when the request reached eBay API.
- `:exception` _(optional)_ -- contains exception data when the exception raised on reaching eBay API, i.e. request timeout; format is `[exception_class_name, exception_message]` (see `ActiveSupport` documentation on this),
- `:exception_object` _(optional)_ -- contains original exception object in case of exception (see `ActiveSupport` documentation on this).

Example successful payload:

```ruby
{
  api_endpoint: 'GeteBayOfficialTime',
  api_version: '1211',
  method: 'post',
  request_context: { site_id: 3 },
  response: #<Ebay::Response:0x0000557285b0f9d0
    @body=
      "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<GeteBayOfficialTimeResponse xmlns=\"urn:ebay:apis:eBLBaseComponents\"><Timestamp>2006-07-05T14:23:03.399Z</Timestamp><Ack>Success</Ack><Version>467</Version><Build>e467_core_Bundled_3145691_R1</Build></GeteBayOfficialTimeResponse>\n",
    @code=200,
    @headers={}>
}
```

Example payload with exception:
```ruby
{
  api_endpoint: 'GeteBayOfficialTime',
  api_version: '1211',
  method: 'post',
  request_context: { site_id: 3 },
  exception: ['Errno::ECONNRESET', 'Connection reset by peer - SSL_connect'],
  exception_object: #<Errno::ECONNRESET: Connection reset by peer - SSL_connect>
}
```

### Events configuration

#### Event name

Event name can be configured:

```ruby
Ebay::Api.configure do |config|
  config.request_event_name = 'custom_event_name'
end
```

#### Request context

`request_context` can be extended via the API client initializer:

```ruby
ebay_api = Ebay::Api.new ebay_auth_token: auth_token, site_id: 3, request_context: { foo: :bar }
```

or set for the existing client object:

```ruby
ebay_api = Ebay::Api.new ebay_auth_token: auth_token, site_id: 3
ebay_api.request_context = { foo: :bar }
```

so the `request_context` in the `payload` will contain passed data:

```ruby
{
  # ...
  request_context: { site_id: 3, foo: :bar }
}
```

### Subscription

As long as the event as default ASN events, subscription logic is the same as for any other ASN event.

```ruby
ActiveSupport::Notifications.subscribe(Ebay::Api.request_event_name) do |name, start_time, end_time, _, payload|
  puts payload
end
```

## Testing

Run `wwtd --parallel` to test with appraisals. Run `rake` to test with current Gemfile.

## Credits

This is a fork of original [`ebay`](https://github.com/codyfauser/ebay) gem by [codyfauser](https://github.com/codyfauser).
It has commits applied from other forks:
- [bkr/ebay](https://github.com/bkr/ebay)
- [kayoom/ebayapi](https://github.com/kayoom/ebayapi)
- [CPlus/ebayapi-19](https://github.com/CPlus/ebayapi-19)
- [main24/ebayapi-19](https://github.com/main24/ebayapi-19)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/veeqo/ebay

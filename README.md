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

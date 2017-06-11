# SalesClient

A [fastlane](https://github.com/fastlane/fastlane) extension gem to get apps sales report from itunes connect.
Get multiple apps reports with single request.

## Installation

Add this lines to your application's Gemfile:

```ruby
gem 'fastlane'
gem 'sales_client'
```

And then execute:

    $ bundle

## Usage

```ruby
# Assign the apps itunes ids to an array
ids = ["1234567..", "1234567..", "1234567.."]
sales = Spaceship::SalesClient.login("username", "password")
result = sales.get_data(ids, Date.today - 3.day, Date.today - 1.day)

=>
[{"metadata"=>{"key"=>"1234567..", "title"=>"Title",
  ...
  {"date"=>"2017-05-21", "total_tax_usd_utc"=>1.733, "units_utc"=>1, "Royalty_utc"=>1.182}
  ...
}]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sadikay/sales_client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

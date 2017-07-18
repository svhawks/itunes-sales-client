# Itunes Sales & Analytics Client

A [fastlane](https://github.com/fastlane/fastlane) extension gem to get apps sales and analytics reports from itunes connect.
Get multiple apps reports with single request.

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'fastlane'
gem 'itunes-sales-client', '~> 1.0.0'
```

And then execute:

    $ bundle

## Usage
### Sales

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
### Analytics

```ruby
analytics = Spaceship::AnalyticsClient.login("username", "password")
data = analytics.get_units("itunes_id", Date.today - 3.day, Date.today - 1.day)

=>
{
  "size"=>1,
  "results"=>[
    {
      "adamId"=> "asdf12345",
      "meetsThreshold"=> true,
      "group"=> nil,
      "data"=> [
        {
          "date" => "2017-07-15T00:00:00Z",
          "units" => 2.0
          },
        {
          "date" => "2017-07-16T00:00:00Z",
          "units" => 1.0
        },
        {
          "date" => "2017-07-17T00:00:00Z",
          "units"=> 3.0 
        }
      ],
      "totals" => 
      {
        "value" => 6.0,
        "type" => "COUNT",
        "key" => "units" 
      }
    }
  ]
}
  
# available analytics options:
data = analytics.get_units("itunes_id", start_time, end_time)
data = analytics.get_page_view_count("itunes_id", start_time, end_time)
data = analytics.get_iap("itunes_id", start_time, end_time)
data = analytics.get_sales("itunes_id", start_time, end_time)
data = analytics.get_paying_users("itunes_id", start_time, end_time)
data = analytics.get_impressions_total("itunes_id", start_time, end_time)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sadikay/sales_client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

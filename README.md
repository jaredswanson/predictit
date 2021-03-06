# Predictit

Ruby bindings for the [PredictIt]('https://www.predictit.org') api.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'predictit'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install predictit

## Usage

### Markets
Collect all current maket data:

```ruby
markets = PredictIt::Markets.all

# Exploring Markets
market = markets.first
# or 
market = markets.find { |mkt| mkt.id == 6867 }

# Contracts
contracts = markets.collect { |mrkt| mrkt.contracts }.flatten
```

### Individual Market
Fetch info for an individual market by market id:

```ruby
market = PredictIt::Markets.market(6867)
```
If you only need info for a single market, the :market method is less resource intensive.

### Exploring Market Contracts
Select an individual `market` using either method above. Then:

```ruby
contract = market.contracts.first
# find
contract = market.contracts.find { |contr| contr.id == 23546 }
# select
contracts = market.contracts.select { |cont| cont.best_buy_no_cost < 0.6 }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/predictit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/predictit/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Predictit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/predictit/blob/master/CODE_OF_CONDUCT.md).

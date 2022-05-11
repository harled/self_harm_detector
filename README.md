# SelfHarmDetector

**This project has been deprecated!** This project was part of a Harled goal cycle, with the purpose of getting initial
experience in creating gems. The idea was to scope this gem to a very simple algorithm (in this case a regex) to 
detect indications of self harm. Given the importance of "doing it right", and the amount of time to required to get it 
there, the team decided it is best to archive the project for the time being with hopes to revisit it in the future.

...

Welcome to SelfHarmDetector, a simple approach to identifying the intention of self-harm in text. This gem is intended 
to act as reference implementation that might be helpful in the identification of any sets of words or intentions 
within text. This gem in no way intends to provide a comprehensive method for identifying self-harm in text.

Currently there is a very simple string matching algorithm enabled, with a basic English dictionary of phrases. 

Please evaluate if this gem and its approach are appropriate for your use case.

Project Lead: Tim Bartram (tim@harled.ca)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'self_harm_detector'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install self_harm_detector

## Usage

The interface is very simple. To attempt to detect an intention of self-harm the following syntax should be used:

```ruby
SelfHarmDetector.detect(text: "A sample set of text")
```

The method will return the number of matches found in the (limited) dictionary.

An alternate interface is available which returns a boolean if the text is concerning or not:

```ruby
# returns true if a score of more than zero
SelfHarmDetector.concerning?(text: "A sample set of text")

# returns true if a score of more than two
SelfHarmDetector.concerning?(text: "A sample set of text", threshold: 2)
```

## Development

This project comes with a Ruby [devcontainer](https://code.visualstudio.com/docs/remote/containers) that works with vscode. It makes development easy and consistent.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Containerized Applications
If your application is containerized you can mount the project directory to the container in the docker-compose. Simply mount the volume:

```yaml
- ~/apps/self_harm_detector:/app/vendor/gems/self_harm_detector
```
to any container that requires it. Now you can add your gem to the gemfile:
```ruby
gem "self_harm_detector", path: "vendor/gems/self_harm_detector"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/harled/self_harm_detector. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/harled/self_harm_detector/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SelfHarmDetector project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/harled/self_harm_detector/blob/master/CODE_OF_CONDUCT.md).

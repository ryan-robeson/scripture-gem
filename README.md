# Scripture

Provides easy access to bible verses in your application.

## Installation

Add this line to your application's Gemfile:

    gem 'scripture'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scripture

## Usage

### From the commandline
    $ scripture lookup 'John 3:16'

### From your code
```ruby
require 'scripture'
verse = Scripture.get_verse('John 3:16')
puts verse
```
### Also supports multiple verses
    John 3:16-17
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

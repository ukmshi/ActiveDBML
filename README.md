# Active::Dbml

ActiveDBML: A Gem for Bridging Database Design and Development

ActiveDBML is a new, useful Ruby gem designed to streamline database development. At its core, this gem provides a Rake Task that outputs Database Markup Language (DBML) from ActiveRecord. Its primary aim is to alleviate discrepancies between database definitions and actual development, ensuring consistency across all stages of development.

The purpose of developing this gem originated from the need to bridge the gap between DB definitions and development, providing a robust solution to a common problem. We hope that by making this gem publicly available, it will not only make the life of developers easier but also contribute to the broader software development community.

ActiveDBML is open for improvements. We eagerly welcome and encourage pull requests and issue submissions. We envision this gem evolving, becoming more comprehensive, and better with collective input and efforts. Our ultimate goal is to enhance this gem further, based on your valuable feedback and contributions. Join us in this journey to make ActiveDBML an essential tool in every developer's toolkit.

## Other language docs

- [English](/)
- [日本語](/docs/ja.md)


## Usage

``` sh
$ rake active_dbml:export

# or (In the case you want to specify the export destination)
$ rake active_dbml:export["export/path.dbml"]
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "active-dbml"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install active-dbml
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

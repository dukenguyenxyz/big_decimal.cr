# BigDecimal Patch

Allows correct `.to_s`, as well as `#from_json` and `.to_json` capabilities for `BigDecimal`

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     big_decimal:
       github: dukeraphaelng/big_decimal.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "big_decimal"
```

## Contributing

1. Fork it (<https://github.com/dukeraphaelng/BigDecimal/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Duke Nguyen](https://github.com/dukeraphaelng) - creator and maintainer

require "json"
require "big"

struct BigDecimal < Number
  # # Sijia Implementation
  # def self.new(pull : JSON::PullParser)
  #   case pull.kind
  #   when .int?
  #     pull.read_int
  #     value = pull.raw_value
  #   when .float?
  #     pull.read_float
  #     value = pull.raw_value
  #   else
  #     value = pull.read_string
  #   end
  #   new(value)
  # end

  # def self.from_json_object_key?(key : String)
  #   new(key)
  # rescue InvalidBigDecimalException
  #   nil
  # end

  # def to_json_object_key
  #   to_s
  # end

  # def to_json(json : JSON::Builder)
  #   json.string(to_s)
  # end

  # My Implementation
  def self.new(pull : JSON::PullParser)
    # # If Int
    # location = pull.location
    # value = pull.read_int

    # If String
    value = pull.read_string

    begin
      value.to_big_d
    rescue ex : OverflowError
      raise JSON::ParseException.new("Can't read {{type.id}}", *location, ex)
    end
  end

  def self.from_json(string_or_io)
    JSON.parse(string_or_io).to_s.to_big_d

    # Simplify this
    # - https://github.com/crystal-lang/crystal/blob/5999ae29b/src/json.cr
    # - https://github.com/crystal-lang/crystal/blob/5999ae29b/src/json/parser.cr
  end

  def self.from_json_object_key?(key : String)
    key.to_big_d?
  end

  def to_json_object_key
    to_s
  end

  def to_json(json : JSON::Builder)
    json.number(self)
  end
end

class JSON::Builder
  def number(number : BigDecimal)
    scalar do
      @io << number
    end
  end
end

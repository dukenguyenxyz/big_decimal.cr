require "json"
require "big"

struct BigDecimal < Number
  def self.new(pull : JSON::PullParser)
    case pull.kind
    when .int?
      pull.read_int
      value = pull.raw_value
    when .float?
      pull.read_float
      value = pull.raw_value
    else
      value = pull.read_string
    end
    new(value)
  end

  def self.from_json_object_key?(key : String)
    new(key)
  rescue InvalidBigDecimalException
    nil
  end

  def to_json_object_key
    to_s
  end

  def to_json(json : JSON::Builder)
    json.number(self)
  end

  def to_s(io : IO) : Nil
    factor_powers_of_ten

    s = @value.to_s

    if @scale == 0
      io << s
      return
    end

    if @scale >= s.size && @value >= 0
      io << "0."
      (@scale - s.size).times do
        io << '0'
      end
      io << s
    elsif @scale >= s.size && @value < 0
      io << "-0.0"
      (@scale - s.size).times do
        io << '0'
      end
      io << s[1..-1]
    elsif (offset = s.size - @scale) == 1 && @value < 0
      io << "-0." << s[offset..-1]
    else
      io << s[0...offset] << "." << s[offset..-1]
    end
  end
end

class JSON::Builder
  def number(number : BigDecimal)
    scalar do
      @io << number
    end
  end
end

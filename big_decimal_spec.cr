require "./big_decimal"
require "spec"

describe BigDecimal, focus: true do
  describe "#from_json and .to_json from valid input" do
    BigDecimal.new.to_json.should eq(%(0))
    BigDecimal.from_json(BigDecimal.new.to_json).should eq(BigDecimal.new)

    BigDecimal.new(0).to_json.should eq(%(0))
    BigDecimal.from_json(%(0)).should eq(0.to_big_d)
    BigDecimal.from_json(BigDecimal.new.to_json).should eq(0.to_big_d)

    BigDecimal.new("41.0123").to_json.should eq(%(41.0123))
    BigDecimal.from_json(%("41.0123")).should eq(BigDecimal.new(BigInt.new(410123), 4))
    BigDecimal.from_json(BigDecimal.new("41.0123").to_json)
      .should eq(BigDecimal.new(BigInt.new(410123), 4))

    BigDecimal.new(1).to_json.should eq(%(1))
    BigDecimal.from_json(%(1)).should eq(1.to_big_d)
    BigDecimal.from_json(BigDecimal.new(1).to_json).should eq(1.to_big_d)

    BigDecimal.new(-1).to_json.should eq(%(-1))
    BigDecimal.from_json(%(-1)).should eq(-1.to_big_d)
    BigDecimal.from_json(BigDecimal.new(-1).to_json).should eq(-1.to_big_d)

    # BigDecimal.new("42_42_42_24.0123_456_789")
    #   .should eq(BigDecimal.new(BigInt.new(424242240123456789), 10))

    # BigDecimal.new("0.0")
    #   .should eq(BigDecimal.new(BigInt.new(0)))

    # BigDecimal.new(".2")
    #   .should eq(BigDecimal.new(BigInt.new(2), 1))

    # BigDecimal.new("2.")
    #   .should eq(BigDecimal.new(BigInt.new(2)))

    # BigDecimal.new("-.2")
    #   .should eq(BigDecimal.new(BigInt.new(-2), 1))

    # BigDecimal.new("-2.")
    #   .should eq(BigDecimal.new(BigInt.new(-2)))

    # BigDecimal.new("-0.1")
    #   .should eq(BigDecimal.new(BigInt.new(-1), 1))

    # BigDecimal.new("-1.1")
    #   .should eq(BigDecimal.new(BigInt.new(-11), 1))

    # BigDecimal.new("123871293879123790874230984702938470917238971298379127390182739812739817239087123918273098.1029387192083710928371092837019283701982370918237")
    #   .should eq(BigDecimal.new(BigInt.new("1238712938791237908742309847029384709172389712983791273901827398127398172390871239182730981029387192083710928371092837019283701982370918237".to_big_i), 49))

    # BigDecimal.new("-123871293879123790874230984702938470917238971298379127390182739812739817239087123918273098.1029387192083710928371092837019283701982370918237")
    #   .should eq(BigDecimal.new(BigInt.new("-1238712938791237908742309847029384709172389712983791273901827398127398172390871239182730981029387192083710928371092837019283701982370918237".to_big_i), 49))

    # BigDecimal.new("-0.1029387192083710928371092837019283701982370918237")
    #   .should eq(BigDecimal.new(BigInt.new("-1029387192083710928371092837019283701982370918237".to_big_i), 49))

    # BigDecimal.new("2")
    #   .should eq(BigDecimal.new(BigInt.new(2)))

    # BigDecimal.new("-1")
    #   .should eq(BigDecimal.new(BigInt.new(-1)))

    # BigDecimal.new("0")
    #   .should eq(BigDecimal.new(BigInt.new(0)))

    # BigDecimal.new("-0")
    #   .should eq(BigDecimal.new(BigInt.new(0)))

    # BigDecimal.new(BigDecimal.new(2))
    #   .should eq(BigDecimal.new(2.to_big_i))

    # BigDecimal.new(BigRational.new(1, 2))
    #   .should eq(BigDecimal.new(BigInt.new(5), 1))
  end

  it "raises InvalidBigDecimalException when #from_json from invalid input" do
    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("derp")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("1.2.3")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("..2")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("1..2")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("a1.2")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("1a.2")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("1.a2")
    # end

    # expect_raises(InvalidBigDecimalException) do
    #   BigDecimal.new("1.2a")
    # end
  end
end

require "pry"
class Triangle
  attr_accessor :side1, :side2, :side3
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
  end

  def valid
    if @sides.all? {|side| side > 0}
      sorted = @sides.max(3)
      if sorted[0] < sorted[1] + sorted[2]
        return true
      end
    end
    return false
  end

  def kind
    if !valid
      begin
        raise TriangleError
      end
    elsif side1 == side2 && side2 == side3
      return :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      return :isosceles
    else
      return :scalene
    end
  end

  class TriangleError < StandardError
     def message
      "the inserted perameters do not make up a valid triagnle"
     end
  end
end
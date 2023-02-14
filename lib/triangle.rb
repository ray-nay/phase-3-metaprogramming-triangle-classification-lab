class Triangle
  class TriangleError < StandardError
  end

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    if @side1 <= 0 || @side2 <= 0 || @side3 <= 0
      raise TriangleError, "Sides must be greater than 0."
    end

    sides = [@side1, @side2, @side3].sort
    if sides[0] + sides[1] <= sides[2]
      raise TriangleError, "Invalid triangle lengths."
    end
  end
end

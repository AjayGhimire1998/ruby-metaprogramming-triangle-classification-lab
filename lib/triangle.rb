class Triangle
  attr_accessor :a, :b, :c
  def initialize a, b, c
    @a = a
    @b = b
    @c = c
  end

  def kind 
    validate_triangle
    if a == b && b == c 
      return :equilateral
    elsif b == c || a == b || a == c
      return :isosceles
    else 
      :scalene
    end
  end

  def validate_triangle 
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |side|
      if side <= 0 
        real_triangle << false 
      end
      raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end

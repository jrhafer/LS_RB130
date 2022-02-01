class Triangle
	def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    raise ArgumentError.new if not_a_triangle?
	end

  def kind
    case [@side1, @side2, @side3].uniq.size
    when 1 then "equilateral"
    when 2 then "isosceles"
    else "scalene"
    end
  end

	private

  def not_a_triangle?
    side_zero_or_less?
    two_side_sums_less_than_third?
  end

  def side_zero_or_less?
    @side1 <= 0 || @side2 <= 0 || @side3 <= 0
  end

  def two_side_sums_less_than_third?
    (@side1 + @side2) <= @side3 || (@side2 + @side3) <= @side1 ||
    (@side3 + @side1) <= @side2
  end
end

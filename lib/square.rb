require 'pry'

class Square
  class SquareError < StandardError; end

  attr_reader :size_a, :size_b, :size_c, :size_d

  def initialize(size_a, size_b, size_c, size_d)
    @size_a = size_a
    @size_b = size_b
    @size_c = size_c
    @size_d = size_d
  end

  def kind 
    valid_squares

      case true
      when all_sides_equal
        :square
      when opposite_sides_equal
         :rectangle
      else
        :quadrilateral
      end
  end

      def sizes
        [size_a, size_b, size_c, size_d]
      end

      def valid_squares
        validate_sides
        violating_quadrilateral
      end

      def validate_sides
      raise SquareError, "raises an error for quadrilaterals with no size" if has_zero_or_negative_sides?
      end

      def has_zero_or_negative_sides?
      sizes.any? { |size| !size.positive? }
      end 

      def violating_quadrilateral
          if size_a >= size_b + size_c + size_d ||
          size_b >= size_a + size_c + size_d ||
          size_c >= size_a + size_b + size_d ||
          size_d >= size_a + size_b + size_c
        raise SquareError, "raises an error for quadrilaterals violating quadrilateral inequality" 
      end
    end

      def all_sides_equal
        size_a == size_b && size_b == size_c && size_c == size_d
      end

      def opposite_sides_equal 
      size_a == size_c && size_b == size_d
      end
  end

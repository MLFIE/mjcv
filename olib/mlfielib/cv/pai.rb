require 'mlfielib/geom/point'
require 'mlfielib/geom/point_op'
require 'mlfielib/geom/rect_op'

module CV
  class Pai
    include Mlfielib::Geom::PointOp
    include Mlfielib::Geom::RectOp
      def initialize(x=0, y=0, width=0, height=0, value=0, type=nil)
       @x = x
       @y = y
       @width = width
       @height = height
       @value = value
       @type = type
      end
  
      attr_accessor :x, :y, :width, :height, :value, :type

      #TODO refactor
      def -(pai)
        Pai.new(x - pai.x, y - pai.y)
      end
      def position
        Mlfielib::Geom::Point.new(@x, @y)
      end
  end
end
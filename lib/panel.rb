class Panel
  module TYPE
    BLACK = :black
    WHITE = :white
    EMPTY = :empty
  end

  attr_reader :type

  def initialize(pos, type)
    @pos = pos
    @type = type
  end

  def reverse
    @type = ( black? ) ? TYPE::WHITE : TYPE::BLACK
  end

  def black?
    @type == TYPE::BLACK
  end

  def white?
    @type == TYPE::WHITE
  end

  def empty?
    @type == TYPE::EMPTY
  end
end

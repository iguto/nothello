class Panel
  # TODO: typeのクラス化(reverseはtypeがもつ)
  module TYPE
    BLACK = :black
    WHITE = :white
    EMPTY = :empty
  end

  attr_reader :type, :pos

  def initialize(pos, type)
    # TODO: posは最終的に不要になるはずなので取り除く
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

  def == other
    self.type == other.type && self.pos == other.pos
  end
end

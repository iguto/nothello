class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def self.parse(str)
    x_str = str.scan(/[a-zA-Z]/).first.downcase
    x = ('a'..'z').to_a.index(x_str)
    y = str.scan(/\d/).first.to_i
    y = adjust(y)
    self.new(x, y)
  end

  def up
    return nil if @y <= 0
    @y -= 1
    self
  end

  def down
    @y += 1
    return nil if @y >= Board::SIZE
    self
  end

  def right
    @x += 1
    return nil if @x >= Board::SIZE
    self
  end

  def left
    return nil if @x <= 0
    @x -= 1
    self
  end

  def == other
    self.x == other.x && self.y == other.y
  end

  private

  def self.adjust(y)
    y - 1
  end
end

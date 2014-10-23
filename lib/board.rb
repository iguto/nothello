require 'forwardable'
# require 'marshal'

class Board
  attr_accessor :panels, :panel_iterator

  SIZE = 8
  DIRECTIONS = [:up, :right, :down, :left]

  def initialize
    create_empty_panels
    set_panel(Position.new(3,3), Panel::TYPE::WHITE)
    set_panel(Position.new(4,4), Panel::TYPE::WHITE)
    set_panel(Position.new(3,4), Panel::TYPE::BLACK)
    set_panel(Position.new(4,3), Panel::TYPE::BLACK)
    @pos = Position.new(0, 0)
  end

  # 指定位置のパネルを返す
  def panel(pos)
    @panels[pos.y][pos.x]
  end

  def set_panel(pos, type)
    @panels[pos.y][pos.x]= Panel.new(pos, type)
  end

  def reversible?(pos, type)
    PanelIterator::DIRECTIONS.each do |dir|
      return true if reversible_dir?(pos, type, dir)
    end
    false
  end

  private

  def reversible_dir?(pos, type, dir)
    reversible_count = 0
    opposite_type = (type == Panel::TYPE::WHITE) ? Panel::TYPE::BLACK : Panel::TYPE::WHITE
    iterator = PanelIterator.new(@panels)
    iterator.set_pos(pos)
    panel = iterator.send(dir)

    while panel do
      return false if panel.empty?
      if panel.send("#{type}?")
        return false if reversible_count == 0
        return true
      end
      reversible_count += 1
      panel = iterator.send(dir)
    end
    false
  end

  def create_empty_panels
    @panels = Array.new(SIZE) { Array.new(SIZE) }
    @panels.map!.with_index do |row, y_index|
      row.map.with_index do |e, x_index|
        Panel.new(Position.new(x_index, y_index), Panel::TYPE::EMPTY)
      end
    end
  end
end

class OutOfBoardError < StandardError; end

class PanelIterator
  DIRECTIONS = [:up, :down, :right, :left]

  def initialize(panels)
    @panels = panels
    @pos = Position.new(0,0)
  end

  def set_pos(pos)
    @pos = pos
  end

  def up
    pos = Marshal.load(Marshal.dump(@pos)).up
    return nil if pos.nil?
    @pos = pos
    panel
  rescue OutOfBoardError => e
    return nil
  end

  def down
    pos = Marshal.load(Marshal.dump(@pos)).down
    return nil if pos.nil?
    @pos = pos
    panel
  rescue OutOfBoardError => e
    return nil
  end

  def right
    pos = Marshal.load(Marshal.dump(@pos)).right
    return nil if pos.nil?
    @pos = pos
    panel
  rescue OutOfBoardError => e
    return nil
  end

  def left
    pos = Marshal.load(Marshal.dump(@pos)).left
    return nil if pos.nil?
    @pos = pos
    panel
  end

  def panel(pos = nil)
    pos ||= @pos
    @panels[pos.y][pos.x]
  end
end

class Player
  def initialize(interface, type)
    @interface = interface
    @type = type
  end

  def play_turn(board)
    pos = @interface.get_input(@type)
    board.put_stone(pos, @type)
  end
end

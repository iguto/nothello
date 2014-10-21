class Player
  def initialize(interface, type)
    @interface = interface
    @type = type
  end

  def play_turn(board)
    pos = @interface.get_input(@type)
    board.set_panel(pos, @type)
  end
end

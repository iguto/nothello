class Player
  def initialize(interface, type)
    @interface = interface
    @type = type
  end

  def play_turn(board)
    loop do
      pos = @interface.get_input(@type)
      break if board.put_stone(pos, @type)
    end
  end
end

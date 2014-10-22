require 'forwardable'

dir = File.dirname(__FILE__)

require File.realpath('panel.rb', dir)
require File.realpath('board_printer.rb', dir)
require File.realpath('type_converter.rb', dir)
require File.realpath('board.rb', dir)
require File.realpath('position.rb', dir)
require File.realpath('interfaces.rb', dir)
require File.realpath('player.rb', dir)

class Othello
  def initialize
    @players = []
    @board_printer = BoardPrinter.new
    @board = Board.new
    player = Player.new(CUI.new, :black)
    @players.push player
  end

  # オセロを開始する
  # - 盤面の表示
  # - 最初のプレイヤの入力待ち
  def start
    loop do
      @board_printer.print(@board)
      player = @players.shift

      put_pos = player.play_turn(@board)
      @players.push player
    end
  end

  private

  # ゲームの終了判定
  def finished?
  end
end


if __FILE__ == $0
  othello = Othello.new
  othello.start
  puts "called"
end

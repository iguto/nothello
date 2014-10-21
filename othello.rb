require 'forwardable'

require './panel'
require './board_printer'
require './board'
require './position'
require './interfaces'
require './player'

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

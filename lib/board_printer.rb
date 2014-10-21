class BoardPrinter
  def initialize
  end

  def print(board)
    puts print_first
    print_panels(board)
  end

  private

  def print_panels(board)
    printable_panels = board.panels.map do |row|
      row.map do |e|
        TypeConverter.type_to_s(e.type)
      end
    end
    printable_panels.each.with_index do |row, index|
      puts "#{index + 1} |" + row.join('|') + '|'
    end
  end

  def print_first
    chars = ('a'..'z').to_a.slice(0, Board::SIZE)
    ' ' * 3 + chars.map { |c| " #{c}" }.join(' ')
  end
end

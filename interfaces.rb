class CUI
  def get_input(type)
    print_prompt(type)
    input = gets.chomp
    Position.parse(input)
  end

  private

  def print_prompt(type)
    puts
    print "player#{TypeConverter.type_to_s(type)}: 石を置くマスを指定してください >  "
  end
end

class GUI
  def get_input
  end
end

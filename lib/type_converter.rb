module TypeConverter
  CONVERT_TABLE = {
    black: '○',
    white: '●',
    empty: '  '
  }

  module_function

  def type_to_s(type)
    CONVERT_TABLE[type]
  end
end

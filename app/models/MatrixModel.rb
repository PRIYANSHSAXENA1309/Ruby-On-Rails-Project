class MatrixModel
  attr_reader :rows, :columns, :data
  
  def initialize(rows, columns, data)
    @rows = rows.to_i
    @columns = columns.to_i
    @data = data.map(&:to_i)
  end
end

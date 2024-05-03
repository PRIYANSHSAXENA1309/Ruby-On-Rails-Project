class MatricesController < ApplicationController
  def index
  end

  def multiply
    matrix1 = build_matrix(params[:A_rows], params[:A_columns], params[:matrixA_data])
    matrix2 = build_matrix(params[:B_rows], params[:B_columns], params[:matrixB_data])

    if invalid_matrices?(matrix1, matrix2)
      render plain: "Matrix dimensions are not compatible for multiplication."
    end

    result = multiply_matrices(matrix1, matrix2)
    result_html = "<table>"
    result.each do |row|
      result_html += "<tr>"
      row.each do |cell|
        result_html += "<td>#{cell}</td>"
      end
      result_html += "</tr>"
    end
    result_html += "</table>"
    render plain: result_html
  end

  private

  def build_matrix(rows, columns, data)
    MatrixModel.new(rows.to_i, columns.to_i, data.map(&:to_i))
  end

  def invalid_matrices?(matrix1, matrix2)
    matrix1.columns != matrix2.rows
  end

  def multiply_matrices(matrix1, matrix2)
    result = Array.new(matrix1.rows) { Array.new(matrix2.columns, 0) }
    (0...matrix1.rows).each do |i|
      (0...matrix2.columns).each do |j|
        (0...matrix1.columns).each do |k|
          result[i][j] += matrix1.data[i * matrix1.columns + k] * matrix2.data[k * matrix2.columns + j]
        end
      end
    end
    result
  end
end

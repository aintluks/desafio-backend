class ExpensesController < ApplicationController
  def show
    @file_upload = FileUpload.new
    @expenses = Expense.find_by_deputy_id(params[:id])
    @higher_spending = @expenses.higher_spending(@expenses)
    @total = @expenses.expenses_total(@expenses)
    @data = @expenses.chart_data(@expenses)
  end
end
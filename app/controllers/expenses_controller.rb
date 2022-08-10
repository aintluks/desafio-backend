class ExpensesController < ApplicationController
  def show
    @file_upload = FileUpload.new
    @expenses ||= Expense.find_by_deputy_id(params[:id])
    @greater_expense ||= @expenses.greater_expense(@expenses)
    @data = @expenses.chart_data(@expenses)
    @total ||= @expenses.expenses_total(@expenses)
  end
end
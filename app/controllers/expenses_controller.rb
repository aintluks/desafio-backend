class ExpensesController < ApplicationController
  def show
    @file_upload = FileUpload.new
    @expenses = Expense.where(deputy_id: params[:id])
  end
end
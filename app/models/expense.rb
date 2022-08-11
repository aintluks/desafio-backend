class Expense < ApplicationRecord
  belongs_to :deputy

  # Scopes
  scope :higher_spending, -> (expenses) { expenses.maximum(:vlr_liquido) }
  scope :expenses_total, -> (expenses) { expenses.sum(:vlr_liquido) }
  scope :chart_data, -> (expenses) { expenses.group_by_month(:dat_emissao, format: "%b %Y").sum(:vlr_liquido) }
end
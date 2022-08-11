module ExpensesHelper
  def to_currency(value)
    number_to_currency(value, locale: "pt-BR")
  end

  def to_date_format(date)
    date.nil? ? '' : I18n.l(date, format: :default)
  end

  def html_class(value, other)
    value == other ? 'bg-danger' : ''
  end
end
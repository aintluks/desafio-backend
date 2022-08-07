class Deputy < ApplicationRecord
  has_many :expenses

  validates :ide_cadastro, :cpf, uniqueness: true
end
class Deputy < ApplicationRecord
  has_many :expenses

  validates :ide_cadastro, uniqueness: true
end
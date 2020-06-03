class Step < ApplicationRecord
  belongs_to :player
  has_many :tips
end

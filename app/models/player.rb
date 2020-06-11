class Player < ApplicationRecord
  # belongs_to :drawroom
    belongs_to :drawroom, optional: true
  has_many :steps
end

class Player < ApplicationRecord
  belongs_to :drawroom
  has_many :steps
end

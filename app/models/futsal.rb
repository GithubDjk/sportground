class Futsal < ApplicationRecord
  validates :name, presence: true
  has_one_attached :image

#   rails_admin do

#   end
end

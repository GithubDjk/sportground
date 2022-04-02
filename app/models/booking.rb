class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :futsal

  # validates :number_of_players, presence: true
  validates :starts_at, presence: true, exclusion: {in: %w(starts_at ends_at)}
  validates :ends_at, presence: true, uniqueness: true
end

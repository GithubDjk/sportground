class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :futsal
  enum open_time: { "6-7 AM": 6, "7-8 AM": 7, "8-9 AM": 8, "9-10 AM": 9, "10-11 AM": 10, "11-12 AM": 11, "12-1 PM": 12, "1-2 PM": 13, "2-3 PM": 14, "3-4 PM": 15, "4-5 PM": 16, "5-6 PM": 17, "6-7 PM": 18 }

  # validates :number_of_players, presence: true
  validates :book_date, presence: true
  validates :book_time, presence: true, numericality: {greater_than: 0} , allow_nil: false
end

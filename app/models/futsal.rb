class Futsal < ApplicationRecord
  include Rails.application.routes.url_helpers
  before_update :send_approved_mail, :if => :approve_changed?

  validates :name, presence: true
  has_one_attached :image
  belongs_to :user
  has_many :bookings

  def send_approved_mail
    FutsalApproveMailer.send_approved_mail(user).deliver if approve
  end

  def profile_picture_url
    return image if image.attached?

    ActionController::Base.helpers.asset_path('cover_futsal.jpg')
  end
end

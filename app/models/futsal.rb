class Futsal < ApplicationRecord
  include Rails.application.routes.url_helpers
  before_update :send_approved_mail, :if => :approve_changed?

  validates :name, presence: true
  has_one_attached :image
  belongs_to :user
  
  def send_approved_mail
    if approve
      FutsalApproveMailer.send_approved_mail(user).deliver
    end
  end

  def profile_picture_url
    return image if image.attached?

    ActionController::Base.helpers.asset_path('cover_futsal.jpg')
  end

end
class Futsal < ApplicationRecord
  after_update :send_approved_mail
  validates :name, presence: true
  has_one_attached :image
  belongs_to :user
  
  def send_approved_mail
    if approve
      FutsalApproveMailer.send_approved_mail(user).deliver
    end
  end
end

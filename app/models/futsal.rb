class Futsal < ApplicationRecord
  after_update :send_approved_mail
  validates :name, presence: true
  has_one_attached :image

#   rails_admin do

#   end

  def send_approved_mail
    if approve
      @user = User.find_by(fname: owner_name)
      FutsalApproveMailer.send_approved_mail(@user).deliver
    end
  end
end

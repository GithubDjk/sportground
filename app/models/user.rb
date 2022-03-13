class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image
  has_many :futsals
  has_many :bookings

  rails_admin do
    edit do
      field :email
      field :fname 
      field :lname 
      field :password
      field :password_confirmation
      field :location
      field :dob
      field :contact_no
      field :image, :multiple_active_storage
      field :role , :enum do
        enum do
          [['admin','admin'], ['user', 'user'], ['owner','owner']]
        end
      end
    end
  end
  
  def full_name
    return email if fname.blank? || lname.blank?

    "#{fname} #{lname}"
  end

  def admin?
    role == "admin"
  end
end

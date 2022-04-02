class FutsalBookMailer < ApplicationMailer
  def send_booked_mail(user)

    puts "***************************************************************************************************"
    @user = user
    mail( :to => @user.email,
    :subject => 'Futsal Booked' )
  end
end

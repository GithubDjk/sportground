class FutsalApproveMailer < ApplicationMailer
  def send_approved_mail(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Futsal Registered' )
  end
end

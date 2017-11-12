class ApplicationMailer < ActionMailer::Base
  default from: 'aquachamal@yahoo.com'
  

  def send_welcome_email(user)
  	@user = user
  	mail(:to => @user.email.downcase, :subject => "Welcome!")
  end	



  
end

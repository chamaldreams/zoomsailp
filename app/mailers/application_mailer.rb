class ApplicationMailer < ActionMailer::Base
  default from: 'rubychamal@gmail.com'
  

  def send_welcome_email(user)
  	@user = user
  	mail(:to => @user.email.downcase, :subject => "Welcome!")
  end	



  
end

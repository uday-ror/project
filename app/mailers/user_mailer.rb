class UserMailer < ApplicationMailer
 default from: 'uday@gmail.com'
 
  def welcome_email(user)
    mail(to: @user.email, subject: 'Welcome to My Coffee Shop')
  end

  def order_confirmation(user)
    @user = user #for showing on view page
    mail(to: user.email, subject: 'Order has been created')
  end
end

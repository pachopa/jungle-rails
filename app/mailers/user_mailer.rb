class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def welcome_email(order)
    @order = order
    @url  = 'http://0.0.0.0:3000/'
    mail(to: 'pachopa0320@gmail.com',
         subject: 'Thanks for the order') do |format|
      format.html { render 'welcome_email' }
    end
  end
end
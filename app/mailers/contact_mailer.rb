# class ContactMailer < ApplicationMailer
#     def welcome_email(user)
#       @user = user   
#       mail(
#       to: 'admin123@yopmail.com',
#       subject: 'New User Registration',
#       locals: { detailed_email: true }
#       )
    
#       mail(
#       to: @user.email,
#       subject: 'Welcome to Poolstack Website'
#       )
#     end
#   end
  
# app/mailers/contact_mailer.rb

class ContactMailer < ApplicationMailer
  def welcome_user_email(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'Welcome to Poolstack Website',
    )
  end

  def welcome_admin_email(user)
    @user = user

    mail(
      to: 'admin123@yopmail.com',
      subject: 'New User Registration',
    )
  end
end

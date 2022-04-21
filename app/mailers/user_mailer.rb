class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    attachments.inline['logo.png']=File.read("#{Rails.root}/app/assets/images/logo.png")
    attachments.inline['user.jpeg']=File.read("#{Rails.root}/public/#{@user.picture.url}")
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def update_email
    @user = params[:user]
    attachments.inline['logo.png']=File.read("#{Rails.root}/app/assets/images/logo.png")
    mail(to: @user.email, subject: 'Your Email Is Updated')
  end
end

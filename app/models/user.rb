class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable, :lockable, :timeoutable

  validates :first_name,presence: true   
  validates :last_name,presence: true        

  after_create :send_admin_mail

  def send_admin_mail

  UserMailer.send_welcome_email(self).deliver_later

  end	



















end

class User < ApplicationRecord
  rolify
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

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:guest) if self.roles.blank?
  end

 
  def admin?
  has_role?(:admin)
  end

def super_admin?
  has_role?(:super_admin)
end

def guest?
  has_role?(:guest)
end

def customer?
  has_role?(:customer)
end

def dealer?
  has_role?(:dealer)
end

def production?
  has_role?(:production)
end


has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#", :large => "600x600" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/










end

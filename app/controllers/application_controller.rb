class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameter , if: :devise_controller?

def configure_permitted_parameter
 
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name, :company_name, :telephone,:fax, :billing_address, :shipping_address,:avatar])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company_name, :telephone,:fax, :web, :billing_address, :shipping_address,:avatar])
end

rescue_from CanCan::AccessDenied do |exception|

  if current_user.has_role? :guest
    redirect_to home_guest_path, :alert => exception.message

  elsif current_user.has_role? :admin and current_user.has_role? :super_admin
    redirect_to home_admin_path, :alert => exception.message 

  elsif current_user.has_role? :production
    redirect_to home_production_path, :alert => exception.message

  elsif current_user.has_role? :dealer
    redirect_to home_dealer_path, :alert => exception.message 

  elsif current_user.has_role? :customer
    redirect_to home_customer_path, :alert => exception.message 


  end
  end 
  

  def after_sign_in_path_for(resource)
  
 if current_user.has_role? :guest or  current_user.roles.empty?
 home_guest_path 

 elsif current_user.has_role? :admin or current_user.has_role? :super_admin
 home_admin_path

elsif current_user.has_role? :customer
 home_customer_path

elsif current_user.has_role? :dealer
 home_dealer_path

elsif current_user.has_role? :production
 home_production_path

 
end 
end     		




end

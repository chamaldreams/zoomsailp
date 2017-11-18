class UsersController < ApplicationController
  


  
 def index
  if current_user.has_role? :super_admin or current_user.has_role? :admin
 	@users = User.all
  @admins = User.with_any_role('admin')
  @productions = User.with_any_role('production')
  @customers = User.with_any_role('customer')
  @dealers = User.with_any_role('dealer')
  else current_user.has_role? :production and current_user.has_role? :customer and current_user.has_role? :dealer and current_user.has_role? :guest 
   redirect_to edit_user_registration_path
  end
  end

 
 
 def show
    @user = nil
    @user = User.find(params[:id]) if current_user.has_role? :admin or current_user.has_role? :super_admin
    @user = current_user if current_user.has_role? :dealer
    @user = current_user if current_user.has_role? :customer
    

 end

 def update
    @user = nil
    @user = User.find(params[:id]) if current_user.has_role? :admin or current_user.has_role? :super_admin
    
    @user = current_user if current_user.has_role? :dealer
    @user = current_user if current_user.has_role? :customer
    redirect_to users_path, alert: "You don't have priviledge to modify other users" and return if current_user.has_role? :customer and @user.id != current_user.id 
    redirect_to users_path, alert: "Invalid user" and return if @user.nil?
    if @user.update_attributes(secure_params)
      redirect_to @user, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user.  #{@user.errors.messages.values}"
    end
  end
 
 
 	

private

def set_userm
      @user = User.find(params[:id])
end 

 def user_params
 	 params.require(:user).permit(:first_name,:last_name, :company_name, :telephone,:fax, :billing_address, :shipping_address,:avatar,:super_admin,:admin,:customer,:dealer,:production,:user_id,:role_id)
 end 
 
def secure_params
    params.require(:user).permit(:firstname, 
                  :lastname, 
                  :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me, 
                  :role_ids, 
                  :company_name, 
                  :billing_address, 
                  :shipping_address, 
                  :telephone, 
                  :fax, 
                  :web)
          
                  
  end



end

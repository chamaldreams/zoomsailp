class HomeController < ApplicationController
   
   skip_before_action :authenticate_user!, :only => [:index]

  
  def index
  
  end

  def admin
    authorize! :admin, HomeController
    
    
      
  end

  def customer
    authorize! :customer, HomeController    
  end

  def dealer
    authorize! :dealer, HomeController
       
  end

  def production
    authorize! :production, HomeController
         
  end

  def guest
    authorize! :guest, HomeController
     

  end
end

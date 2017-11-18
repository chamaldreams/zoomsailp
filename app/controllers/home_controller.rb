class HomeController < ApplicationController
   before_action :authenticate_user!
   skip_before_action :authenticate_user!, :only => [:index]

  
  def index
  
  end

  def admin
      authorize! :admin , HomeController,:message => "You Can't Access to admin Account."
  end

  def customer
        authorize! :bbs , HomeController,:message => "You Can't Access to customer Account."
  end

  def dealer
        authorize! :bbs , HomeController,:message => "You Can't Access to dealer Account."
  end

  def production
         authorize! :bbs , HomeController,:message => "You Can't Access to production Account."
  end

  def guest
     authorize! :guest , HomeController

  end
end

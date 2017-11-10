class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]

  
  def index
  end

  def admin
  end

  def customer
  end

  def dealer
  end

  def production
  end

  def guest
  end
end

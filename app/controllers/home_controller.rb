class HomeController < ApplicationController
  def index
    flash[:notice] = "Please log in."
  end

end

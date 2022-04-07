class MainController < ApplicationController
  def index
    flash[:notice] = 'Hello From Notice'
    flash[:alert] = 'Hello From Alert'
  end
end

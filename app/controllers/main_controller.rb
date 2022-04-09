class MainController < ApplicationController
  def index
    flash.now[:notice] = 'Hello From Notice'
    flash.now[:alert] = 'Hello From Alert'
  end
end

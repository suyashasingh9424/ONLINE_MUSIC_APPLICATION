class HomesController < ApplicationController
  def index
  end

  def dashboard
    @user = current_user
  end
end

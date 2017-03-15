class WelcomeController < ApplicationController

  def index
    user_init?
    if (@user.nil?)
    else
      session[:user_id] = @user.id
      redirect_to '/notes'
    end
  end

end

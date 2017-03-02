class UsersController < ApplicationController

	def login
		if session[:user_id].nil?
			
			if params[:user].nil?
			
			else
				@user = User.find_by(login: params[:user][:login], password: params[:user][:password])
			
				if (@user.nil?)
				else			
					session[:user_id] = @user.id
					redirect_to '/notes'
				end
			end
		else
			redirect_to '/notes'
		end
	end
	
	
	
	def logout
		session[:user_id] = nil
		redirect_to :controller => 'welcome', :action => 'index'
	end

end
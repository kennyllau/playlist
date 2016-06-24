class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	def new
	end

	def create
		@user = User.new user_params
		if @user.save
			redirect_to "/sessions"
		else
			flash[:errors] = @user.errors.full_messages
			errors = @user.errors.full_messages
			errors.each do  |t|
				if t == "First name can't be blank"
					flash[:first_name] = "First name can't be blank"
				end
				if t == "Last name can't be blank"	
					flash[:last_name] = "Last name can't be blank"
				end	
				if t == "Email can't be blank"	
					flash[:email] = "Last name can't be blank"
				end	
				if t == "Password can't be blank"	
					flash[:password] = "Last name can't be blank"
				end	
			end	
			redirect_to "/users"
		end	
	end

	def show
		@user = User.find(params[:id])
		@songlist = User.find(@user.id).songlists.select(:song_id).group(:song_id).having("count(*) > 0")
		
		# Songlist.select(:user_id, :song_id).group(:user_id, :song_id).having("count(*)>0")

	end
	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end

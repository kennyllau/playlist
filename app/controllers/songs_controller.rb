class SongsController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@songs = Song.all.order(created_at: :desc)
	end

	def create
		@song = Song.create(title: song_params[:title], artist: song_params[:artist], count: 0)
	  	if @song.save
	  		redirect_to '/songs'
	  	else
	  		flash[:errors] = @song.errors.full_messages
	  		redirect_to '/songs'
	  	end	
	end

	def show
		@song = Song.find(params[:id])
		@people = Song.find(@song.id).users.group(:id)
		# .songlists.select(:user_id).group(:user_id).having("count(*) > 0")
	end




	private
	def song_params
		params.require(:song).permit(:title, :artist)
	end
end

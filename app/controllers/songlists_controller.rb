class SonglistsController < ApplicationController
	def create
		Songlist.create(song_id: params[:id], user_id: current_user.id )
		redirect_to	'/songs'
	end
end

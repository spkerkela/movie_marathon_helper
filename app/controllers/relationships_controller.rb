class RelationshipsController < ApplicationController
	before_filter :signed_in_user


#	respond_to :html, :js
	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		# respond_with @user
		redirect_to @user
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		# respond_with @user
		redirect_to @user
	end
end
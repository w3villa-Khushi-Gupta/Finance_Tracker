class FriendshipController < ApplicationController
    
    def create
        friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
        if friendship.save
            friend = User.find(params[:friend_id]).full_name
            flash[:notice]="Following #{friend}"
        else
            flash[:alert]="Something went wrong"
        end
        redirect_to my_friends_path
    end
    
    def destroy
        friend =User.find(params[:id])
        friendship= Friendship.where(user_id: current_user.id, friend_id: friend.id).first
        friendship.destroy
        flash[:notice]="Unfollowed #{friend.full_name} "
        redirect_to my_friends_path
    end
end

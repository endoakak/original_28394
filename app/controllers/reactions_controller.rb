class ReactionsController < ApplicationController
  def create
    @reaction = Reaction.new(comment_id: params[:id], post_id: params[:post_id], user_id: current_user.id)
    @reaction.save
  end

  def destroy
    @reaction = Reaction.find_by(comment_id: params[:id], post_id: params[:post_id], user_id: current_user.id)
    @reaction.destroy
  end
end

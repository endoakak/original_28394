class ReactionsController < ApplicationController
  def create
    @reaction = Reaction.new(comment_id: params[:id], post_id: params[:post_id], user_id: current_user.id)
    if @reaction.save
      ActionCable.server.broadcast 'reaction_channel', content: params[:id]
    end
  end

  def destroy
    @reaction = Reaction.find_by(comment_id: params[:id], post_id: params[:post_id], user_id: current_user.id)
    if @reaction.destroy
      ActionCable.server.broadcast 'reaction_channel', content: params[:id]
    end
  end

  private

  def reaction_params
    params.permit(:post_id, :id).merge(user_id: current_user.id)
  end
end

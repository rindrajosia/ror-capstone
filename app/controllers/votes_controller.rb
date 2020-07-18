class VotesController < ApplicationController
  def create
    v = Vote.where(user_id: current_user.id, article_id: params[:article_id])
    @vote = current_user.votes.new(article_id: params[:article_id])
    flash.notice = if v.empty? && @vote.save
                     'Voted successfully.'
                   else
                     "You can't vote twice the same article"
                   end
    if params[:category_id]
      redirect_to category_path(id: params[:category_id])
    else
      redirect_to article_path(id: params[:article_id])
    end
  end

  def show; end
end

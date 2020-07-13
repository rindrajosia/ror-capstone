class VotesController < ApplicationController
  before_action :create_categories

  def create
    v = Vote.where(user_id: current_user.id, article_id: params[:article_id])
    @vote = current_user.votes.new(article_id: params[:article_id])
    flash.notice = if v.empty? && @vote.save
                     'Voted successfully.'
                   else
                     "You can't vote twice the same article"
                   end
    redirect_to article_path(id: params[:category_id])
  end

  def show; end
end

class VotesController < ApplicationController
  before_action :create_categories

    def create
      v = Vote.where(user_id: current_user.id, article_id: params[:article_id])
      @vote = current_user.votes.new(article_id: params[:article_id])
      if v.empty? && @vote.save
        flash.notice = "Voted successfully."
      else
        flash.notice = "You can't vote twice the same article"
      end
      redirect_to articles_path
    end

    def show
    end

end

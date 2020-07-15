class CategoriesController < ApplicationController
  before_action :current_user
  def show
    @cat = Categorie.list(params[:id])
    @category_id = params[:id]
  end
end

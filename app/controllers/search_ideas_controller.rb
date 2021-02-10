class SearchIdeasController < ApplicationController
  def index
    @ideas = Idea.search(params[:keyword]).order(id: :desc).page(params[:page])

    render 'ideas/index'
  end
end

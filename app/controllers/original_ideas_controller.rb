class OriginalIdeasController < ApplicationController
  def index
    @original_ideas = OriginalIdea.all.order(id: :desc).page(params[:page])
  end

  def show
    @original_idea = OriginalIdea.find params[:id]
  end

  def create
    @original_idea = OriginalIdea.new(original_idea_params)
    if user_signed_in?
      @original_idea.user_id = current_user.id
    end

    @original_idea.idea_chain_original_ideas.build(idea_id: params[:original_idea][:idea_1])
    @original_idea.idea_chain_original_ideas.build(idea_id: params[:original_idea][:idea_2])

    if @original_idea.save
      redirect_to original_idea_path(@original_idea)
    else
      @idea_1 = Idea.find params[:original_idea][:idea_1]
      @idea_2 = Idea.find params[:original_idea][:idea_2]
      render 'generations/index'
    end
  end

  private
    def original_idea_params
      params.require(:original_idea).permit(:title)
    end
end

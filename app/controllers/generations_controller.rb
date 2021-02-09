class GenerationsController < ApplicationController
  def index
    @idea_1 = Idea.all.sample
    if @idea_1.present?
      @idea_2 = Idea.where.not(id: @idea_1.id).sample
    end
  end

  def generate
    @idea_1 = Idea.all.sample
    @idea_2 = Idea.where.not(id: @idea_1.id).sample
  end
end

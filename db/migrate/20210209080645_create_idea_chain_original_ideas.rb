class CreateIdeaChainOriginalIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :idea_chain_original_ideas do |t|
      t.references :idea
      t.references :original_idea

      t.timestamps
    end
  end
end

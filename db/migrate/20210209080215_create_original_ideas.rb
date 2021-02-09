class CreateOriginalIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :original_ideas do |t|
      t.string :title
      t.references :user

      t.timestamps
    end
  end
end

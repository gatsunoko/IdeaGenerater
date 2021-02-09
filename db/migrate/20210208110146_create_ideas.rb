class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :detail
      t.references :user

      t.timestamps
    end
  end
end

class CreateCommentsReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :comments_reactions, id: false do |t|
      t.belongs_to :comment
      t.belongs_to :reaction
    end
  end
end

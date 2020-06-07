class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :external_id, null: true
      t.string :source, null: true
      t.timestamps
      t.index [:source, :external_id]
    end
  end
end

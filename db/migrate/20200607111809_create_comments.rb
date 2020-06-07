class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.text :body
      t.string :external_id, null: true
      t.string :source, null: true
      t.timestamps
      t.index [:source, :external_id]
    end
  end
end

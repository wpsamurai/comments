class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :external_id, null: true
      t.string :source, null: true
      t.timestamps
      t.index [:source, :external_id]
    end
  end
end

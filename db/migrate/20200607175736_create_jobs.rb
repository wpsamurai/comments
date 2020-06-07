class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :status, limit: 25, null: false, default: :created
      t.string :source_class, limit: 25, null: false
      t.json :summary
      t.datetime :finished_at, null: true
      t.timestamps
    end
  end
end

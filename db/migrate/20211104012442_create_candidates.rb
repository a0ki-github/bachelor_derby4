class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :title, null: false
      t.string :youtube_url, null: false

      t.timestamps
    end
  end
end

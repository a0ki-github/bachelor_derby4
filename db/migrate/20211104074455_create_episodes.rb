class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.datetime :onair_at, null: false

      t.timestamps
    end
  end
end

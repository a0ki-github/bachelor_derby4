class CreateCandidatesEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates_episodes do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end

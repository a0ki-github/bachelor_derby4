class AddIndexToCandidatesEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_index :candidates_episodes, [:candidate_id, :episode_id], unique: true
  end
end

class RemoveColumnFromMovieActors < ActiveRecord::Migration[5.0]
  def change
    remove_column :movie_actors, :num_of_movies
  end
end

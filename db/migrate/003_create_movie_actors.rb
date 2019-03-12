class CreateMovieActors < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_actors do |t|
      t.integer :movie_id
      t.integer :actor_id
      t.integer :num_of_movies
      t.integer :salary_from_movie
    end
  end
end

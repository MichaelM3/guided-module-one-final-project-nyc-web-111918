class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :parental_rating
      t.string :release_date
      t.float :rating
    end
  end
end

class Movie < ActiveRecord::Base
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def self.highest_rating_movies
    self.all.each do |movie|
      if movie.rating > 84.0
        puts "#{movie.title} recieved #{movie.rating}!"
      end
    end
    puts "Press enter to go back to the main menu"
    gets.chomp
    system("clear")
    run
  end

  def self.find_all_actors_in_movie(input)
    self.all.find do |movie|
      if movie.title == input
        movie.actors
      end
    end
  end

  def self.movies_before_2000
    self.all.each do |movie|
      if movie.release_date.to_i < 2000
        puts movie.title
      end
    end
    run
  end

end

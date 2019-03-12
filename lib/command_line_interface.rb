def welcome
  puts "Welcome to the Internet Movie Database!"
end

def run
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('Just a Movie Database')
  welcome
  main_menu
  input = get_user_input
  case input
  when "1"
    system("clear")
    find_movie_information
  when "2"
    system("clear")
    find_actor_information
  when "3"
    system("clear")
    find_by_genre
  when "4"
    system("clear")
    Actor.most_movies
  when "5"
    system("clear")
    find_salary_from_movies_for_actor
  when "6"
    system("clear")
    Actor.create_actor
  when "7"
    system("clear")
    Movie.movies_before_2000
  when "8"
    system("clear")
    update_movie
  when "9"
    Actor.delete_actor
  when "10"
    list_all_movies
  when "11"
    list_all_actors
  when "12"
    list_all_genres
  when "13"
    Movie.highest_rating_movies
  when "14"
    exit_database
  else
    system("clear")
    puts "Invalid input, please try again"
    run
  end
end

def get_user_input
  user_input = gets.chomp
  user_input.strip.downcase
end

def main_menu
  puts "1.  Find Movie information"
  puts "2.  Find Actor information"
  puts "3.  Find movies by genre"
  puts "4.  See the actor with the most movies"
  puts "5.  Find an actors salary"
  puts "6.  Enter a new actor into the database"
  puts "7.  All movies before the year 2000"
  puts "8.  Update information about a movie"
  puts "9.  Delete an actor"
  puts "10. Shows a list of all movies"
  puts "11. Shows a list of all actors"
  puts "12. Shows a list of all movie genres"
  puts "13. Heres a list of the best movies out there!"
  puts "14. Quit the database"
end

def exit_database
  puts "Are you sure you want to quit? :( "
  puts "Well if so just press enter"
  get_user_input
  puts "Goodbye!"
end

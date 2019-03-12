def find_by_movie(input)
  Movie.find do |movie|
    if movie.title.downcase == input
      movie.title
    end
  end
end

def list_all_movies
  system("clear")
  Movie.all.map do |movie|
    puts movie.title
  end
  puts "When you're ready press enter to go back to the main menu"
  input = get_user_input
  system("clear")
  run
end

def find_movie_information
  puts "What movie are you looking for?"
  input = get_user_input
  system("clear")
  movie = find_by_movie(input)
  if movie != nil
    puts "Title: #{movie.title}"
    puts "Genre: #{movie.genre}"
    puts "Parental Rating: #{movie.parental_rating}"
    puts "Rating: #{movie.rating}"
    puts "Release Date: #{movie.release_date}"

    puts "Press 1 to see actors, press 2 to go back to the main menu"
    answer = get_user_input
    case answer
    when "1"
      system("clear")
      actors = (movie).actors
      actors.map do |actor|
        puts actor.name
      end
      puts "Press enter to go back to the main menu"
      gets.chomp
      system("clear")
      run
    else
      answer = "2"
      system("clear")
      run
    end
  else
    puts "Invalid input please try again"
    system("clear")
    run
  end
end

def list_all_genres
  system("clear")
  puts "Heres a list of all genres!"
  Movie.all.map do |movie|
    puts movie.genre
  end
  puts "Press enter to go back to the main menu"
  gets.chomp
  system("clear")
  run
end

def find_by_genre
  puts "Enter genre"
  input = get_user_input
  genreChosenMovies = Movie.where(genre: input.titleize)
  genreChosenMovies.map do |movie|
    puts movie.title
  end
  puts "Press enter to go back to the main menu"
  gets.chomp
  system("clear")
  run
end

def update_movie
  puts "Enter movie you'd like to update"
  input = get_user_input
  movie = find_by_movie(input)
  if movie != nil
    loop do
      puts "What would you like to update?"
      puts "1. Update title"
      puts "2. Update genre"
      puts "3. Update parental_rating"
      puts "4. Update rating"
      puts "5. Return to main menu"
      input1 = get_user_input
      case input1
      when "1"
        puts "Change title"
        input2 = get_user_input
        movie.update(title: input2)
      when "2"
        puts "Change genre"
        input2 = get_user_input
        movie.update(genre: input2)
      when "3"
        puts "Change parental_rating"
        input2 = get_user_input
        movie.update(parental_rating: input2)
      when "4"
        puts "Change rating"
        input2 = get_user_input
        movie.update(rating: input2)
      when "5"
        system("clear")
        run
        break
      else
        system("clear")
        puts "Invalid input please try again"
      end
    end
  else
    puts "Invalid input please try again"
    run
  end
end

def find_actors(input)
  Actor.find do |actor|
    if actor.name.downcase == input
      actor.name
    end
  end
end

def list_all_actors
  system("clear")
  Actor.all.map do |actor|
    puts actor.name
  end
  puts "When you're ready press enter to go back to the main menu"
  input = get_user_input
  system("clear")
  run
end

def find_actor_information
  puts "What actor are you looking for?"
  input = get_user_input
  system("clear")
  actor = find_actors(input)
  if actor != nil
    puts actor.name
    puts actor.age
    puts actor.gender
    puts actor.birthplace
    loop do
      puts "Press 1 to see movies, press 2 to go back to the main menu"
      answer = get_user_input
      case answer
      when "1"
        system("clear")
        movies = actor.movies
        movies.map do |movie|
          puts movie.title
        end
        puts "Press enter to go back to the main menu"
        gets.chomp
        system("clear")
        run
        break
      when
        answer = "2"
        system("clear")
        run
        break
      else
        puts "Invalid input!"
        run
      end
    end
  else
    puts "Invalid input!"
    run
  end
end

def find_salary_from_movies_for_actor
  puts "Whos salary are you looking for?"
  input = get_user_input
  actor = find_actors(input)
  if actor != nil
    movieActors = actor.movie_actors
    movieActors.map do |movieActor|
      puts "$#{movieActor.salary_from_movie} from #{movieActor.movie.title}"
    end
    run
  else
    puts "Invalid input!"
    run
  end
end

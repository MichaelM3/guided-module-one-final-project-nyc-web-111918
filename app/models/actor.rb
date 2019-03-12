class Actor < ActiveRecord::Base
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.most_movies
    allMovies = self.all.map do |actor|
      actorHash = {}
      actorHash[actor.name] = actor.movies.length
      actorHash
    end
    mostMoviesActorName = allMovies.max_by do |key, value|
      value
    end
    puts "#{mostMoviesActorName.keys[0]} with #{mostMoviesActorName.values[0]} movies!"
    # Actor.find_by(name: mostMoviesActorName.keys[0]) -> <Actor#1ois89fj2lk @name="Michael Muniz" ....>
    puts "Press enter to go back to the main menu"
    gets.chomp
    system("clear")
    run
  end

  # def self.youngest_actor
  #   array = []
  #   self.all.map do |actor|
  #     array << actor.age
  #   end
  #   array.sort[0]
  # end

  # def self.highest_salary_from_movies_under_30
  #   youngActorHash = {}
  #   youngActors = self.joins(:movie_actors).where("actors.age < 30", "movie_actors.salary_from_movie")
  #     binding.pry
      #if youngActorHash already has a key of actor.name, add the value of row.salary_from_movie,
      #else add key of actor.name to youngActorHash AND set value to row.salary_from_movie
  #end

  def self.create_actor
    puts "Add name"
    name = get_user_input
    puts "Add age"
    age = get_user_input
    puts "Add gender"
    gender = get_user_input
    puts "Add birthplace"
    birthplace = get_user_input
    # find or create
    Actor.create(name: name, age: age, gender: gender, birthplace: birthplace)
    puts "Your new actor was added, and you will now be returned to the main menu"
    run
  end

  def self.delete_actor
      puts "Type in the actor"
      input = get_user_input
      actor = actor = find_actors(input)
      if actor != nil
        puts "How cold of you! Well... are you sure?"
        system("clear")
      else
        system("clear")
        puts "Invalid actor name, here is a list of actors"
        Actor.all.map do |actor|
          puts actor.name
        end
      end
    puts "Press 1 to delete actor"
    puts "Press 2 for main menu"
    input2 = get_user_input
    loop do
      case input2
      when "1"
        actor.delete
        puts "Actor was deleted from database"
        puts "Now returning to main menu"
        run
        break
      when "2"
        system("clear")
        run
        break
      else
        puts "Invalid input, please try again"
        system("clear")
      end
    end
  end
end

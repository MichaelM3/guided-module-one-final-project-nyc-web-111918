def faker_actor_info
fakeName = Faker::Name.unique.name
random_age = rand(8..80)
random_gender = ["Male", "Female"].sample
random_birthplace = Faker::Address.city
newActor = Actor.create(name: fakeName, age: random_age, gender: random_gender, birthplace: random_birthplace)
end

def faker_movie_info
  fakeTitle = Faker::Book.unique.title
  fakeGenre = Faker::Book.genre
  randParentalRating = ["G", "PG", "PG13", "R"].sample
  randReleaseDate = rand(1968..2018).to_s
  randRating = rand(10..100).to_f
  newMovie = Movie.create(title: fakeTitle, genre: fakeGenre, parental_rating: randParentalRating, release_date: randReleaseDate, rating: randRating)
end

def faker_movie_actor_info
  randMovieId = rand(1..20)
  randActorId = rand(1..30)
  randSalaryFromMovie = rand(10000..1000000)
  newMovieActor = MovieActor.find_or_create_by(movie_id: randMovieId, actor_id: randActorId, salary_from_movie: randSalaryFromMovie)
end

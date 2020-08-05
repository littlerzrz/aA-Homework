# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

# IMPORTANT:
# For all of the following problems return an ActiveRecord::Association unless
# otherwise specified. 

def lowest_score
  # Find the id and title of movies with a scores lower than 2
  Movie
    .select('id','title') 
    .where('score < ?', 2)
end

def wesley_movies
  # Find the id, title, and score of all the movies the actor "Wesley Snipes"
  # was in.
  Movie
    .joins(castings: :actor)
    .where('actors.name= ?', "Wesley Snipes" )
    .select('movies.id', 'movies.title', 'movies.score')
    .distinct
end

def meg_movies
  # Find the id, title, and year of movies Meg Ryan has acted in.
  # Order them in ascending order by year.
  Movie
    .select(:id,:title,:yr)
    .joins(castings: :actor)
    .where('actors.name = ?', "Meg Ryan")
    .distinct
    .order(:yr)
end

def susan_supporting_roles
  # Find the id and title of all movies in which Susan Sarandon
  # appeared but not as a lead actor.

  # Reminder: In the castings table the lead actor for a movie will
  # have an ord = 1 
  Movie
    .select(:id, :title)
    .joins(castings: :actor)
    .where('actors.name = ? AND castings.ord != ?','Susan Sarandon', 1)
    .distinct
end

def biggest_cast
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)
  Movie
    .select(:id, :title)
    .joins(:castings)
    .group('movies.id')
    .order('COUNT(castings.actor_id) DESC')
    .limit(3)

end
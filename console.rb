require_relative ('models/star.rb')
require_relative ('models/movie.rb')
require_relative ('models/role.rb')
require('pry')

Actor.delete_all
Movie.delete_all

actor1 = Actor.new ({
  'first_name' => 'Edward',
  'last_name' => 'Norton'
})
actor2 = Actor.new ({
  'first_name' => 'Brad',
  'last_name' => 'Pitt'
})

actor3 = Actor.new ({
  'first_name' => 'Maggie',
  'last_name' => 'Gyllenhaal'
})
movie1 = Movie.new ({
  'title' => 'Fight Club',
  'genre' => 'Drama'
})
movie2 = Movie.new ({
  'title' => 'Secretary',
  'genre' => 'Comedy'
})
movie3 = Movie.new ({
  'title' => 'Seven',
  'genre' => 'Crime drama'
})
actor1.save
actor2.save
actor3.save
movie1.save
movie2.save
movie3.save

movie3.title = "Happy"
movie3.update

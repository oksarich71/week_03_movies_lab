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

role1 = Role.new ({
  'movie_id' => movie3.id,
  'actor_id' => actor2.id,
  'fee' => 3000000
  })
  role2 = Role.new ({
  'movie_id' => movie2.id,
  'actor_id' => actor1.id,
  'fee' => 2000000
  })

  role3 = Role.new ({
  'movie_id' => movie2.id,
  'actor_id' => actor2.id,
  'fee' => 2000000
  })

  role4 = Role.new ({
  'movie_id' => movie2.id,
  'actor_id' => actor3.id,
  'fee' => 2000000
  })
  role1.save
  role2.save
  role3.save
  role4.save

binding.pry
nil

# movie3.title = "Happy"
# movie3.update

# p movie3.actors

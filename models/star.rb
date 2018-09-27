require('pg')
require_relative('../db/sql_runner.rb')
require_relative('./movie')

class Actor

  attr_accessor(:first_name, :last_name)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i()
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
      sql = "INSERT INTO actors (
          first_name,
          last_name
          )
        VALUES ($1, $2)
        RETURNING id;"

      values = [@first_name, @last_name]
      result = SqlRunner.run(sql, values)

      result_hash = result[0]
      string_id = result_hash['id']
      id = string_id.to_i()
      @id = id
     end

     def self.delete_all
     sql = "DELETE FROM actors"
     SqlRunner.run(sql)
   end

   def update()
     sql = "UPDATE actors SET (first_name, last_name) = ($1, $2) WHERE id = $3;"
     values = [@first_name, @last_name, @id]
     SqlRunner.run(sql, values)
    end

    def movies
      sql = 'SELECT * FROM movies
              INNER JOIN roles
              ON movies.id = roles.movie_id
              WHERE roles.actor_id = $1;'
      movies = SqlRunner.run(sql, [@id])
      return movies.map { |movies_hash| Movie.new(movies_hash) }
    #return user object
    end

end #class end

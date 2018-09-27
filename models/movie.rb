require('pg')
require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor(:title, :genre)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i()
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies (
        title,
        genre
        )
      VALUES ($1, $2)
      RETURNING id;"

    values = [@title, @genre]
    result = SqlRunner.run(sql, values)

    result_hash = result[0]
    string_id = result_hash['id']
    id = string_id.to_i()
    @id = id
   end

   def self.delete_all
     sql = "DELETE FROM movies"
     SqlRunner.run(sql)
   end

   def update()
     sql = "UPDATE movies SET (title, genre) = ($1, $2) WHERE id = $3;"
     values = [@title, @genre, @id]
     SqlRunner.run(sql, values)
    end

end #class end

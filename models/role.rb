require('pg')
require_relative('../db/sql_runner.rb')

class Role

  attr_accessor(:movie_id, :actor_id, :fee)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i()
    @movie_id = options['movie_id']
    @actor_id = options['actor_id']
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO roles (
        movie_id,
        actor_id,
        fee
        )
      VALUES ($1, $2, $3)
      RETURNING id;"

    values = [@movie_id, @actor_id, @fee]
    result = SqlRunner.run(sql, values)

    result_hash = result[0]
    string_id = result_hash['id']
    id = string_id.to_i()
    @id = id
   end

  
end

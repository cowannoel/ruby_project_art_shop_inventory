require_relative( '../db/sql_runner' )

class Print

  attr_reader( :title, :description, :artist_id, :wholesale_cost, :retail_price, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @artist_id = options['artist_id']
    @wholesale_cost = options['wholesale_cost']
    @retail_price = options['retail_price']
  end


  def self.all()
    sql = "SELECT * FROM prints"
    results = SqlRunner.run( sql )
    return results.map { |print| Print.new( print ) }
  end



  def save()
    sql = "INSERT INTO prints
    (
      title,
      description,
      artist_id,
      wholesale_cost,
      retail_price
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@title, @description, @artist_id, @wholesale_cost, @retail_price]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end

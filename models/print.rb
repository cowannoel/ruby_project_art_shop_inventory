require_relative( '../db/sql_runner' )

class Print

  attr_reader( :id )
  attr_accessor( :title, :description, :artist_id, :wholesale_cost, :retail_price, :quantity )


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @artist_id = options['artist_id'].to_i
    @wholesale_cost = options['wholesale_cost']
    @retail_price = options['retail_price']
    @quantity = options['quantity'].to_i
  end


  def self.all()
    sql = "SELECT * FROM prints"
    results = SqlRunner.run( sql )
    return results.map { |print| Print.new( print ) }
  end


  def self.delete_all
    sql = "DELETE FROM prints"
    SqlRunner.run( sql )
  end


  def self.find( id )
    sql = "SELECT * FROM prints
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Print.new( results.first )
  end


  def stock_level()
    if @quantity <= 3
      return "Low Stock"
    end
  end

  def stock_level_out()
    if @quantity <= 0
      return "Out of Stock"
    end
  end


  def artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    return Artist.new(results.first)
  end


  def save()
    sql = "INSERT INTO prints
    (
      title,
      description,
      artist_id,
      wholesale_cost,
      retail_price,
      quantity
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@title, @description, @artist_id, @wholesale_cost, @retail_price, @quantity]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


  def update()
    sql = "UPDATE prints
    SET
    (
      title,
      description,
      artist_id,
      wholesale_cost,
      retail_price,
      quantity
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@title, @description, @artist_id, @wholesale_cost, @retail_price, @quantity, @id]
    SqlRunner.run( sql, values )
  end


  def delete()
    sql = "DELETE FROM prints
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end

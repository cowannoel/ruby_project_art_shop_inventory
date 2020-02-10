require_relative( '../db/sql_runner' )

class Stock

  attr_reader( :product_id, :id )
  attr_accessor ( :quantity )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @print_id = options['print_id']
    @quantity = options['quantity']
  end


  def self.all()
    sql = "SELECT * FROM stocks"
    results = SqlRunner.run( sql )
    return results.map { |stock| Stock.new( stock ) }
  end


  def self.delete_all
    sql = "DELETE FROM stocks"
    SqlRunner.run( sql )
  end



  def save()
    sql = "INSERT INTO stocks
    (
      print_id,
      quantity
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@print_id, @quantity]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


  def update()
    sql = "UPDATE stocks
    SET
      quantity = $1
    WHERE id = $2"
    values = [@quantity, @id]
    SqlRunner.run( sql, values )
  end


  def delete()
    sql = "DELETE FROM stocks
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



end

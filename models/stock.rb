require_relative( '../db/sql_runner' )

class Stock

  attr_reader( :quantity, :product_id, :id )

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




end

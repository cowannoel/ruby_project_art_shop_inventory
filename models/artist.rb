require_relative( '../db/sql_runner' )

class Artist

  attr_reader( :id )
  attr_accessor( :first_name, :last_name, :contact )


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @contact = options['contact']
  end



  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run( sql )
    return results.map { |artist| Artist.new( artist ) }
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end




  def save()
    sql = "INSERT INTO artists
    (
      first_name,
      last_name,
      contact
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @contact]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


  def update()
    sql = "UPDATE artists
    SET
    (
      first_name,
      last_name,
      contact
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@first_name, @last_name, @contact, @id]
    SqlRunner.run( sql, values )
  end


end

require_relative('../models/artist.rb')
require_relative('../models/print.rb')
require_relative('../models/stock.rb')
require('pry-byebug')


Artist.delete_all()


artist1 = Artist.new ({
  'first_name' => 'Torbien',
  'last_name' => 'Giehler',
  'contact' => 'Berlin'
  })

artist1.save()


artist2 = Artist.new ({
  'first_name' => 'Nick',
  'last_name' => 'Smith',
  'contact' => 'Crinan'
  })

artist2.save()


artist3 = Artist.new ({
  'first_name' => 'Camillie',
  'last_name' => 'Walala',
  'contact' => 'Paris'
  })

artist3.save()


artist4 = Artist.new ({
  'first_name' => 'Ben',
  'last_name' => 'Eine',
  'contact' => 'London'
  })

artist4.save()


print1 = Print.new({
  'title' => 'Machapuchare',
  'description' => 'Screen Print',
  'artist_id' => artist1.id,
  'wholesale_cost' => 250,
  'retail_price' => 450
  })

print1.save()


print2 = Print.new({
  'title' => 'Van Gogh',
  'description' => 'Giclee',
  'artist_id' => artist2.id,
  'wholesale_cost' => 200,
  'retail_price' => 400
  })

print2.save()


print3 = Print.new({
  'title' => 'Dreams Come True',
  'description' => 'Screen Print',
  'artist_id' => artist3.id,
  'wholesale_cost' => 300,
  'retail_price' => 500
  })

print3.save()


print4 = Print.new({
  'title' => 'Tenderloin',
  'description' => 'Screen Print',
  'artist_id' => artist4.id,
  'wholesale_cost' => 500,
  'retail_price' => 800
  })

print4.save()


stock1 = Stock.new({
  'print_id' => print1.id,
  'quantity' => 10
  })

stock1.save()

stock2 = Stock.new({
  'print_id' => print2.id,
  'quantity' => 3
  })

stock2.save()

stock3 = Stock.new({
  'print_id' => print3.id,
  'quantity' => 5
  })

stock3.save()


stock4 = Stock.new({
  'print_id' => print4.id,
  'quantity' => 6
  })

stock4.save()

  binding.pry
  nil

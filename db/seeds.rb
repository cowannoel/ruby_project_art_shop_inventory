require_relative('../models/artist')
require_relative('../models/print')
require('pry-byebug')

Print.delete_all()
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
  'retail_price' => 450,
  'quantity' => 10
  })

print1.save()


print2 = Print.new({
  'title' => 'Van Gogh',
  'description' => 'Giclee',
  'artist_id' => artist2.id,
  'wholesale_cost' => 200,
  'retail_price' => 400,
  'quantity' => 3
  })

print2.save()


print3 = Print.new({
  'title' => 'Dreams Come True',
  'description' => 'Screen Print',
  'artist_id' => artist3.id,
  'wholesale_cost' => 300,
  'retail_price' => 500,
  'quantity' => 5
  })

print3.save()


print4 = Print.new({
  'title' => 'Tenderloin',
  'description' => 'Screen Print',
  'artist_id' => artist4.id,
  'wholesale_cost' => 500,
  'retail_price' => 800,
  'quantity' => 6
  })

print4.save()


binding.pry
nil

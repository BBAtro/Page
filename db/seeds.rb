30.times do 
  title = Faker::Hipster.word 
  Tag.create title: title
end 
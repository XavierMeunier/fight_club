# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 5 beginners
5.times do 
  Fighter.create({name: Faker::Name.name})
end

# Create 30 advanced fighters
30.times do 
  level   = Faker::Number.between(1,100)
  available_upgrade = level*10
  health  = Faker::Number.between(1,available_upgrade)
  strength = available_upgrade - health

  fighter = Fighter.new({
    name:         Faker::Name.name,
    health:       health,
    strength:      strength,
    experience:   0,
    level:        level,
    available_upgrade: 0
  })
  fighter.save(validate: false)
end

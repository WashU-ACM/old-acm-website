# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brandon = User.create({ first_name: "Brandon", last_name: "Meeks", email: "brandon.meeks@wustl.edu" })
shane = User.create({ first_name: "Shane", last_name: "Carr", email: "shane.carr@wustl.edu" })

technologies = Technology.create([
	{ name: "ruby" },
	{ name: "python" },
	{ name: "java" }
])

brandon.icpc_entries.create({ uva_id: 1106, name: "Machine Works", description: "Moby Dick", code: "// Look ye, pudding-heads should never grant premises." })
shane.icpc_entries.create({ uva_id: 202, name: "Repeating Decimals", description: "Hello World", code: "// sample" })
shane.icpc_entries.create({ uva_id: 184, name: "Laser Lines", description: "Lorem Ipsum", code: "// dolor sit amet" })

brandon.technologies << technologies[0]
brandon.technologies << technologies[2]
shane.technologies << technologies[1]
shane.technologies << technologies[2]

acmsite = brandon.projects.create({ name: "ACM Website", description: "Project matching and ICPC records" })
acmsite.technologies << technologies[0]
acmsite.technologies << technologies[1]
acmsite.enthusiasts << shane

shopeel = shane.projects.create({ name: "Shopeel", description: "Friends don't let friends shop alone" })
shopeel.technologies << technologies[0]
shopeel.technologies << technologies[2]

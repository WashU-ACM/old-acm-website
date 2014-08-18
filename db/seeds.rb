# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
	if User.count == 0
		brandon = User.create({ first_name: "Brandon", last_name: "Meeks", email: "brandon.meeks@wustl.edu" })
		shane = User.create({ first_name: "Shane", last_name: "Carr", email: "shane.carr@wustl.edu" })

		brandon.icpc_entries.create({ uva_id: 1106, name: "Machine Works", description: "Moby Dick", code: "// Look ye, pudding-heads should never grant premises." })
		shane.icpc_entries.create({ uva_id: 202, name: "Repeating Decimals", description: "Hello World", code: "// sample" })
		shane.icpc_entries.create({ uva_id: 184, name: "Laser Lines", description: "Lorem Ipsum", code: "// dolor sit amet" })

		acmsite = brandon.projects.create({ name: "ACM Website", description: "Project matching and ICPC records" })

		shopeel = shane.projects.create({ name: "Shopeel", description: "Friends don't let friends shop alone" })
	end
end

if Category.count == 0
	cse = Category.create({ name: "Computer Science / Technology", class_name: "proj-cse" })
	Category.create({ name: "Electrical Engineering", class_name: "proj-ee" })
	Category.create({ name: "Mechanical Engineering", class_name: "proj-meche" })
	Category.create({ name: "Other", class_name: "proj-other" })

	Project.all.each do |proj|
		proj.category = cse
		proj.save!
	end
end

if !User.first.nil? && User.first.slug.nil?
	# Generate slugs
	User.all.each{ |v| v.save! }
	Project.all.each{ |v| v.save! }
	AcmProject.all.each{ |v| v.save! }
end

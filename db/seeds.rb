require_relative("../models/student.rb")
require_relative("../models/house.rb")
require("pry-byebug")

Student.delete_all()
House.delete_all()

house1 = House.new({
	"name" => "Griffindor"
})

house2 = House.new({
	"name" => "Hufflepuff"
})

house3 = House.new({
	"name" => "Ravenclaw"
})

house4 = House.new({
	"name" => "Slytherin"
})

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
	"first_name" => "Harry",
	"last_name" => "Potter",
	"house_id" => house1.id,
	"age" => 12
})

student2 = Student.new({
	"first_name" => "Draco",
	"last_name" => "Malfoy",
	"house_id" => house4.id,
	"age" => 12
})

student1.save()
student2.save()

binding.pry
nil

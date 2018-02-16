require_relative("../db/sql_runner")

class Student
	attr_reader :id, :first_name, :last_name, :house_id, :age

	def initialize(options)
		@id = options["id"].to_i
		@first_name = options["first_name"] # Harry
		@last_name = options["last_name"] # Potter
		@house_id = options["house_id"] # 13, for example
		@age = options["age"].to_i # 12
	end

	def save()
		sql = "
		INSERT INTO students (first_name, last_name, house_id, age)
		VALUES ($1, $2, $3, $4) RETURNING id;
		"
		values = [@first_name, @last_name, @house_id, @age]
		student = SqlRunner.run(sql, values)
		@id = student.first["id"].to_i
	end

	def self.all()
		sql = "SELECT * FROM students;"
		rows = SqlRunner.run(sql)
		all_students = rows.map {|student| Student.new(student) }
		return all_students
	end

	def self.find(id)
		sql = "SELECT * FROM students WHERE id = $1"
		values = [id]
		row = SqlRunner.run(sql, values)[0]
		student = Student.new(row)
		return student
	end

	def self.delete_all()
		sql = "DELETE FROM students;"
		SqlRunner.run(sql)
	end

	def house()

		# sql = "SELECT * FROM houses WHERE id = $1"
		# values = [@house_id]
		# row = SqlRunner.run(sql, values)[0]
		# house = House.new(row)
		# return house

		house = House.find(@house_id)
		return house
	end
end

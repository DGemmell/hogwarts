require_relative("../db/sql_runner")

class House
	attr_reader :id, :name

	def initialize(options)
		@id = options["id"].to_i
		@name = options["name"]
	end

	def save()
		sql = "INSERT INTO houses (name) VALUES ($1) RETURNING id;"
		values = [@name]
		house = SqlRunner.run(sql, values)
		@id = house.first["id"].to_i
	end

	def self.all()
		sql = "SELECT * FROM houses;"
		rows = SqlRunner.run(sql)
		all_houses = rows.map {|house| House.new(house) }
	end

	def self.delete_all()
		sql = "DELETE from houses;"
	  SqlRunner.run(sql)
	end

	def self.find(id)
		sql = "SELECT * from houses WHERE id = $1"
		values = [id]
		row = SqlRunner.run(sql, values)[0]
    house = House.new(row)
		return house
	end
end

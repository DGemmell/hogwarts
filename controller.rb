require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/student.rb")
require_relative("./models/house.rb")

# index
get "/students" do
	@students = Student.all()
	erb(:index)
end

# new
get "/students/new" do
	@houses = House.all()
	erb(:new)
end

# create
post "/students" do
  student = Student.new(params)
	student.save()
	redirect to "/students"
end

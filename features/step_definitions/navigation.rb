Given("I visit home page") do
  visit root_path
end

Given("I visit fighters page") do
  visit fighters_path
end

Given("I visit fighter page") do
  visit fighter_path(@fighter)
end

Given("I visit fighter shape page") do
  visit shape_fighter_path(@fighter)
end

Given("I visit new fighter page") do
  visit new_fighter_path(@fighter)
end

Given("I visit fights page") do
  visit fights_path
end

When("I click on {string}") do |button_name|
  click_on button_name
end

When "I click on a fighter profile" do
  click_on("Show", match: :first)
end

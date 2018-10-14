Given("I visit home page") do
  visit root_path
end

Given("I visit fighters page") do
  visit fighters_path
end

When("I click on {string}") do |button_name|
  click_on button_name
end
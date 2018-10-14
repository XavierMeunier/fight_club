Then("I should be on home page") do
  expect(page).to have_css("h1", :text => "Home")
end

Then("I should be on fighters page") do
  expect(page).to have_css("h1", :text => "Fighters")
end

Then("I should be on fighter page") do
  expect(page).to have_css("h1", :text => "Fighter")
end

Then("I should be on new fighter page") do
  expect(page).to have_css("h1", :text => "New fighter")
end
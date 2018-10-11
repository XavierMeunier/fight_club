Then("I should be on home page") do
  expect(page).to have_css("h1", :text => "Home")
end

Then("I should be on fighters page") do
  expect(page).to have_css("h1", :text => "Fighters")
end
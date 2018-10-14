Given("Multiple fighters exist") do
  @fighter1 = create(:fighter)
  @fighter2 = create(:fighter)
  @fighter3 = create(:fighter)
  @fighter4 = create(:fighter)
  @fighter5 = create(:fighter)
end

Then("I should see all fighters") do
  expect(page).to have_css("td", :text => @fighter1.name)
  expect(page).to have_css("td", :text => @fighter2.name)
  expect(page).to have_css("td", :text => @fighter3.name)
  expect(page).to have_css("td", :text => @fighter4.name)
  expect(page).to have_css("td", :text => @fighter5.name)
end
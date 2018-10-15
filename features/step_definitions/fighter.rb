Given('a fighter exists') do
  @fighter = create(:fighter)
end

Given('a fighter without available upgrade exists') do
  @fighter = create(:fighter, :advanced_fighter, :without_avaible_upgrade)
end

Given('Multiple fighters exist') do
  @fighter1 = create(:fighter)
  @fighter2 = create(:fighter)
  @fighter3 = create(:fighter)
  @fighter4 = create(:fighter)
  @fighter5 = create(:fighter)
end

Then('I should see all fighters') do
  expect(page).to have_css('td', text: @fighter1.name)
  expect(page).to have_css('td', text: @fighter2.name)
  expect(page).to have_css('td', text: @fighter3.name)
  expect(page).to have_css('td', text: @fighter4.name)
  expect(page).to have_css('td', text: @fighter5.name)
end

Then('I should see fighter attributes') do
  expect(page).to have_css('p.name',              text: @fighter.name)
  expect(page).to have_css('p.health',            text: @fighter.health)
  expect(page).to have_css('p.strength',          text: @fighter.strength)
  expect(page).to have_css('p.experience',        text: @fighter.experience)
  expect(page).to have_css('p.level',             text: @fighter.level)
  expect(page).to have_css('p.available_upgrade', text: @fighter.available_upgrade)
end

Then('I should see upgraded fighter attributes') do
  expect(page).to have_css('p.name',              text: @fighter.name)
  expect(page).to have_css('p.health',            text: @fighter.reload.health)
  expect(page).to have_css('p.strength',          text: @fighter.reload.strength)
  expect(page).to have_css('p.experience',        text: @fighter.experience)
  expect(page).to have_css('p.level',             text: @fighter.level)
  expect(page).to have_css('p.available_upgrade', text: @fighter.reload.available_upgrade)
end

Then('I should see shape button') do
  expect(page).to have_css('a', text: 'Shape')
end

Then('I should not see shape button') do
  expect(page).to_not have_css('a', text: 'Shape')
end

When('I complete the shape upgrade fighter form') do
  find(:xpath, '//input[@id="fighter_health_range"]').set @fighter.health + @fighter.available_upgrade / 2
  find(:xpath, '//input[@id="fighter_strength_range"]').set @fighter.strength + @fighter.available_upgrade / 2
  click_button('Shape')
end

When('I complete the new fighter form') do
  @fighter = build(:fighter)
  fill_in('Name', with: @fighter.name)
  attach_file('Avatar', "#{Rails.root}/spec/support/features/image.jpg")
  click_button('Create Fighter')
end

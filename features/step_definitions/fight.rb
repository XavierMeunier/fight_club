Given('Multiple fights exist') do
  @fight1 = create(:fight)
  @fight2 = create(:fight)
  @fight3 = create(:fight)
  @fight4 = create(:fight)
  @fight5 = create(:fight)
end

When('I complete the new fight form') do
  find(:select, id: 'fight_winner').find(:option, text: @fighter1.name).select_option
  find(:select, id: 'fight_looser').find(:option, text: @fighter2.name).select_option
  click_button('Create Fight')
end

Then('I should see fight statistics') do
  expect(page).to have_css('p.winner_punches')
  expect(page).to have_css('p.looser_punches')
  expect(page).to have_css('p.victory_type')
  expect(page).to have_css('p.rounds')
  expect(page).to have_css('p.winner')
  expect(page).to have_css('p.looser')
end

Then('I should see all fights') do
  expect(page).to have_css('td', text: @fight1.id)
  expect(page).to have_css('td', text: @fight2.id)
  expect(page).to have_css('td', text: @fight3.id)
  expect(page).to have_css('td', text: @fight4.id)
  expect(page).to have_css('td', text: @fight5.id)
end

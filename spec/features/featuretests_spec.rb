require 'spec_helper'

feature "Name input" do
  scenario "Players submit their names" do
    sign_in_and_play
    expect(page).to have_content "It's Sam vs. Stefan!"
  end
end

feature "Hit points" do
  scenario "Player 1 sees Player 2's hit points" do
    sign_in_and_play
    expect(page).to have_content "Stefan: 100 HP"
  end
end

feature "Attacking first time" do
  scenario "Player 1 attacks Player 2 and receives confirmation" do
    sign_in_and_play
    click_button "attack"
    expect(page).to have_content "Sam attacked Stefan for 10HP!"
  end

  scenario "reduce players hp by 10 on attack" do
    sign_in_and_play
    click_button "attack"
    click_button "Back to Battle!"
    expect(page).to have_content "Stefan: 90 HP"
  end



end

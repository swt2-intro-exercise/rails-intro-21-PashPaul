require 'rails_helper'

describe "Edit page", type: :feature do
it "should save changes" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    page.fill_in 'paper[title]', with: '1'
    page.fill_in 'paper[venue]', with: '2'
    page.fill_in 'paper[year]', with: 3
    find('input[type="submit"]').click

    @paper.reload
    expect(@paper.title).to eq("1")
    expect(@paper.venue).to eq("2")
    expect(@paper.year).to eq(3)
  end
  it "should have a select for authors" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    expect(page).to have_field('paper[author_ids][]')
  end
end






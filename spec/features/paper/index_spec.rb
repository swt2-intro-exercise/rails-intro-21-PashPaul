require 'rails_helper'

describe "Papers", type: :feature do
    it "should link to the new index page'" do
        visit papers_path
        expect(page).to have_text("Title")
        expect(page).to have_text("Year")
        expect(page).to have_text("Venue")
        expect(page).to have_link 'New Paper', href: new_paper_path
      end
      it "should have a link to delete a paper" do
        @paper = FactoryBot.create :paper
        visit papers_path
        expect(page).to have_link 'Destroy'
        expect(Paper.count).to eq(1)
        find('a[data-method="delete"]').click
        expect(Paper.count).to eq(0)
      end

  it "should filter the papers" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    @paper.save
    @paper2 = Paper.new(title: "1", venue: "2", year: 3)
    @paper2.save
    visit '/papers?year=3'
    expect(page).to have_text("1")
    expect(page).to have_text("2")
    expect(page).to have_text("3")
    expect(page).to_not have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to_not have_text("Mind 49: 433-460")
    expect(page).to_not have_text("1950")
  end
end
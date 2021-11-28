require 'rails_helper'

describe "Edit page", type: :feature do
it "should save changes" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    page.fill_in 'author[first_name]', with: 'Vorname'
    page.fill_in 'author[last_name]', with: 'Nachname'
    page.fill_in 'author[homepage]', with: 'URL'
    find('input[type="submit"]').click

    @alan.reload
    expect(@alan.first_name).to eq("Vorname")
    expect(@alan.last_name).to eq("Nachname")
    expect(@alan.homepage).to eq("URL")
  end
end
require 'rails_helper'

describe "Authors", type: :feature do
  it "should link to the new author page'" do
    visit authors_path
    expect(page).to have_text("Name")
    expect(page).to have_text("Homepage")
    expect(page).to have_link 'New author', href: new_author_path
  end
end
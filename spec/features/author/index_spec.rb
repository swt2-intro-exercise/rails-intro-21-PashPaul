require 'rails_helper'

describe "Authors", type: :feature do
  it "should link to the new author page'" do
    visit authors_path
    expect(page).to have_text("Name")
    expect(page).to have_text("Homepage")
    expect(page).to have_link 'New author', href: new_author_path
  end
  it "should have a link to delete an author" do
    @author = FactoryBot.create :author
    visit authors_path
    expect(page).to have_link 'Delete'
    expect(Author.count).to eq(1)
    find('a[data-method="delete"]').click
    expect(Author.count).to eq(0)
  end
end
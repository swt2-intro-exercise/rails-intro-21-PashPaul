require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should have first name, last name, and homepage" do
    author = Author.new(first_name: "Na", last_name: "Me", homepage: "Www")
    expect(author.first_name).to eq("Na")
    expect(author.last_name).to eq("Me")
    expect(author.homepage).to eq("Www")
    expect(author.name).to eq("Na Me")
  end
end

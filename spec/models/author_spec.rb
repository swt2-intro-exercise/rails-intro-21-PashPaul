require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should have first name, last name, and homepage" do
    author = Author.new(first_name: "Na", last_name: "Me", homepage: "Www")
    expect(author.first_name).to eq("Na")
    expect(author.last_name).to eq("Me")
    expect(author.homepage).to eq("Www")
    expect(author.name).to eq("Na Me")
  end
  it "should not validate without last name" do
    author = Author.new(first_name: "Na", last_name: "", homepage: "Www")
    expect(author).to_not be_valid
  end
  it "should have a paper" do
    @author = Author.new(first_name: "1", last_name: "2", homepage: "3")
    expect(@author.papers.length).to eq(0)
  end
end

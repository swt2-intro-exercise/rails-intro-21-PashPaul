require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should have title, venue, year" do
    paper = Paper.new(title: "Name", venue: "Ort", year: 2021)
    expect(paper.title).to eq("Name")
    expect(paper.venue).to eq("Ort")
    expect(paper.year).to eq(2021)
  end
end

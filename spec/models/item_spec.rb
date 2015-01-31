require 'rails_helper'

RSpec.describe  Item, :type => :model do

  let(:item) { FactoryGirl.create(:item) }

  it "has a valid factory" do
    expect(FactoryGirl.build(:item)).to be_valid
  end
  
  describe "when title is not present" do
    before { item.title = " " }
    it { should_not be_valid }
  end

end
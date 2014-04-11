require 'spec_helper'

describe Listing do
  describe "initialization" do
    it "gets a slug" do
      @listing = Listing.new(name: "Jason's House", price: 100)

      expect(@listing.slug).to eq("jason_s_house")
    end
  end
end

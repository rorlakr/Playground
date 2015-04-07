require './spec/spec_helper'

describe Stemmer::Porter do
  describe "1a" do
    it "caresses -> caress" do
      expect(Stemmer::Porter.new.s_1a("caresses")).to eq "caress"
    end

    it "ssesasses -> ssesass" do
      expect(Stemmer::Porter.new.s_1a("ssesasses")).to eq "ssesass"
    end

    it "ponies -> poni" do
      expect(Stemmer::Porter.new.s_1a("ponies")).to eq "poni"
    end

    it "ties -> ti" do
      expect(Stemmer::Porter.new.s_1a("ties")).to eq "ti"
    end

    it "caress -> caress" do
      expect(Stemmer::Porter.new.s_1a("caress")).to eq "caress"
    end

    it "cats -> cat" do
      expect(Stemmer::Porter.new.s_1a("cats")).to eq "cat"
    end
  end

  describe "1b" do
    it "feed -> feed" do
      expect(Stemmer::Porter.new.s_1b("feed")).to eq "feed"
    end

    it "agreed -> agree" do
      expect(Stemmer::Porter.new.s_1b("agreed")).to eq "agree"
    end
  end

end

require './spec/spec_helper'

describe Stemmer::Porter do
  describe "1a" do
    it "caresses -> caress" do
      expect(Stemmer::Porter.new.s_1a("caresses")).to eq "caress"
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

    it "plastered -> plaster" do
      expect(Stemmer::Porter.new.s_1b("plastered")).to eq "plaster"
    end

    it "bled -> bled" do
      expect(Stemmer::Porter.new.s_1b("bled")).to eq "bled"
    end

    it "motoring -> motor" do
      expect(Stemmer::Porter.new.s_1b("motoring")).to eq "motor"
    end

    it "sing -> sing" do
      expect(Stemmer::Porter.new.s_1b("sing")).to eq "sing"
    end
  end

  describe "1c" do
    it "happy -> happi" do
      expect(Stemmer::Porter.new.s_1c("happy")).to eq "happi"
    end

    it "sky -> sky" do
      expect(Stemmer::Porter.new.s_1c("sky")).to eq "sky"
    end
  end
end

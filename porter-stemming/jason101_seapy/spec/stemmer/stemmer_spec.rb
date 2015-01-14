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

  describe "vowel" do
    it "f -> false" do
      expect(Stemmer::Porter.new.vowel?("f")).to eq false
    end

    it "a -> true" do
      expect(Stemmer::Porter.new.vowel?("a")).to eq true
    end

    it "e -> true" do
      expect(Stemmer::Porter.new.vowel?("e")).to eq true
    end

    it "i -> true" do
      expect(Stemmer::Porter.new.vowel?("i")).to eq true
    end

    it "o -> true" do
      expect(Stemmer::Porter.new.vowel?("o")).to eq true
    end

    it "u -> true" do
      expect(Stemmer::Porter.new.vowel?("u")).to eq true
    end
  end

  describe "m count" do
    it "fe -> 1" do
      expect(Stemmer::Porter.new.m_count("fe")).to eq 1
    end

    it "feaaaaa -> 1" do
      expect(Stemmer::Porter.new.m_count("feaaaaa")).to eq 1
    end

    it "feasagaaa -> 3" do
      expect(Stemmer::Porter.new.m_count("feasagaaa")).to eq 5
    end

    it "zzz -> 0" do
      expect(Stemmer::Porter.new.m_count("zzz")).to eq 0
    end

    it "aaa -> 0" do
      expect(Stemmer::Porter.new.m_count("aaa")).to eq 0
    end
  end

  describe "has_vowel?" do
    it "fe -> true" do
      expect(Stemmer::Porter.new.has_vowel?("fe")).to eq true
    end

    it "zzz -> false" do
      expect(Stemmer::Porter.new.has_vowel?("zzz")).to eq false
    end

    it "aaa -> true" do
      expect(Stemmer::Porter.new.has_vowel?("aaa")).to eq true
    end
  end
end

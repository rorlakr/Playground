require 'spec_helper'

describe PoterStemming::Parser do
  subject(:parser) { PoterStemming::Parser.new }
  describe "#new" do
    it 'does make parser' do
      expect(parser).to_not be_nil
    end
  end

  describe "#parse_step" do
    context 'when 1a step' do
      it { expect(parser.parse_step(:one_a, "caresses")).to eq("caress") }
      it { expect(parser.parse_step(:one_a, "ponies")).to eq("poni") }
      it { expect(parser.parse_step(:one_a, "carress")).to eq("carress") }
      it { expect(parser.parse_step(:one_a, "cats")).to eq("cat") }
      it { expect(parser.parse_step(:one_a, "suns")).to eq("sun") }
    end

    context 'when 1b step' do
      it { expect(parser.parse_step(:one_b, "feed")).to eq("feed") }
      it { expect(parser.parse_step(:one_b, "agreed")).to eq("agree") }
      it { expect(parser.parse_step(:one_b, "plastered")).to eq("plaster") }
      it { expect(parser.parse_step(:one_b, "bled")).to eq("bled") }
      it { expect(parser.parse_step(:one_b, "motoring")).to eq("motor") }
      it { expect(parser.parse_step(:one_b, "sing")).to eq("sing") }
    end

    context 'when 1b1 step' do
      it { expect(parser.parse_step(:one_b_one, "conflat")).to eq("conflate") }
      it { expect(parser.parse_step(:one_b_one, "troubl")).to eq("trouble") }
      it { expect(parser.parse_step(:one_b_one, "tann")).to eq("tan") }
      it { expect(parser.parse_step(:one_b_one, "hopp")).to eq("hop") }
      it { expect(parser.parse_step(:one_b_one, "fail")).to eq("fail") }
      it { expect(parser.parse_step(:one_b_one, "fil")).to eq("file") }
    end
  end
  describe "#parse" do
    it { expect(parser.parse("controller")).to eq("control") }
    it { expect(parser.parse("sleeps")).to eq("sleep") }
    it { expect(parser.parse("serialize")).to eq("serial") }
    it { expect(parser.parse("bless")).to eq("bless") }
  end
end

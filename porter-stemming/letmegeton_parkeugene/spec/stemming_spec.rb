require './app/stemming'
require 'spec_helper'

RSpec.describe Stemming,focus:true do

  describe "#m" do
    it "returns true for m('relation')" do
      expect(Stemming.new.m('relation')).to eq(3)
    end
  end

  describe "#v" do
    it "returns true for v('plaster')" do
      expect(Stemming.new.v?('plaster')).to be_truthy
    end
  end

  describe "#o" do
    it "returns false for o?('fail')" do
      expect(Stemming.new.o?('fail')).to be_falsy
    end

    it "returns true for o('fil')" do
      expect(Stemming.new.o?('fil')).to be_truthy
    end
  end

  describe "#a" do
    it "returns 'caress' for b('caresses')" do
      expect(Stemming.new.a('caresses')).to eq("caress")
    end
    it "returns 'poni' for b('ponies')" do
      expect(Stemming.new.a('ponies')).to eq("poni")
    end
    it "returns 'carress' for b('carress')" do
      expect(Stemming.new.a('carress')).to eq("carress")
    end
    it "returns 'cat' for b('cats')" do
      expect(Stemming.new.a('cats')).to eq("cat")
    end
  end

  describe "#b" do
    it "returns 'feed' for b('feed')" do
      expect(Stemming.new.b('feed')).to eq("feed")
    end

    it "returns 'agree' for b('agreed')" do
      expect(Stemming.new.b('agreed')).to eq("agree")
    end

    it "returns 'plaster' for b('plastered')" do
      expect(Stemming.new.b('plastered')).to eq("plaster")
    end

    it "returns 'bled' for b('bled')" do
      expect(Stemming.new.b('bled')).to eq("bled")
    end

    it "returns 'monitor' for b('monitoring')" do
       expect(Stemming.new.b('monitoring')).to eq("monitor")
    end

    it "returns 'sing' for b('sing')" do
        expect(Stemming.new.b('sing')).to eq("sing")
    end

    it "returns 'conflate' for b('conflated')" do
      expect(Stemming.new.b('conflated')).to eq("conflate")
    end

    it "returns 'trouble' for b('troubling')" do
      expect(Stemming.new.b('troubling')).to eq("trouble")
    end

    it "returns 'size' for b('sized')" do
      expect(Stemming.new.b('sized')).to eq("size")
    end

    it "returns 'tan' for b('tanned')" do
      expect(Stemming.new.b('tanned')).to eq("tan")
    end

    it "returns 'hop' for b('hopping')" do
      expect(Stemming.new.b('hopping')).to eq("hop")
    end

    it "returns 'fail' for b('failing')" do
      expect(Stemming.new.b('failing')).to eq("fail")
    end

    it "returns 'file' for b('filing')" do
      expect(Stemming.new.b('filing')).to eq("file")
    end
  end
end
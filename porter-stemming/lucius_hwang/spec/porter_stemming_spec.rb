require_relative 'spec_helper'

describe PorterStemming do

  let(:pstem) { PorterStemming.new }

  describe "인스턴스 메소드 정의" do
    it "#stem (어간을 반환)" do
      pstem.set('caresses', 'sses')
      expect(pstem.stem).to eq "care"
    end

    it "#measure (모음 + 자음의 갯수 반환)" do
      pstem.set('caresses', 'sses')
      expect(pstem.measure).to eq 1
    end

    it "#m? (단어인가? measure > 0) " do
      pstem.set('caresses', 'sses')
      expect(pstem.m?).to be_truthy
    end

    it "#v? (모음이 포함되었는가?)" do
      pstem.set('caresses', 'sses')
      expect(pstem.v?).to be_truthy
    end

    it '#o? (cvc로 끝나고 w,x,y 가 아닌 경우인가?)' do
      pstem.set('caredsses', 'sses')
      expect(pstem.o?).to be_truthy
    end

    it '#not_o? (cvc로 끝나고 w,x,y 가 아닌 경우의 반대)' do
      pstem.set('careesses', 'sses')
      expect(pstem.not_o?).to be_truthy
    end
  end

  describe "1a 단계" do

    it "caresses는 caress로 변환된다." do
      pstem.set('caresses')
      expect(pstem.step_1a).to eq 'caress'
    end

    it "ponies는 poni로 변환된다." do
      pstem.set('ponies')
      expect(pstem.step_1a).to eq 'poni'
    end

    it "carress는 carress로 변환된다." do
      pstem.set('carress')
      expect(pstem.step_1a).to eq 'carress'
    end

    it "cats는 cat로 변환된다." do
      pstem.set('cats')
      expect(pstem.step_1a).to eq 'cat'
    end

  end

  describe "1b 단계" do
    pstem = PorterStemming.new
    it "feed => feed" do
      pstem.set('feed', 'eed')
      expect(pstem.step_1b).to eq 'feed'
    end
    it "agreed => agree" do
      pstem.set('agreed', 'eed')
      expect(pstem.step_1b).to eq 'agree'
    end
    it "plastered => plaster" do
      pstem.set('plastered', 'ed')
      expect(pstem.step_1b).to eq 'plaster'
    end
    it "bled => bled" do
      pstem.set('bled', 'ed')
      expect(pstem.step_1b).to eq 'bled'
    end
    it "monitoring => monitor" do
      pstem.set('monitoring', 'ing')
      expect(pstem.step_1b).to eq 'monitor'
    end
    it "sing => sing" do
      pstem.set('sing', 'ing')
      expect(pstem.step_1b).to eq 'sing'
    end
  end

  describe "1b1 단계" do
    it "conflat => conflate" do
      pstem.set('conflat')
      expect(pstem.step_1b1).to eq 'conflate'
    end
    it "troubl => trouble" do
      pstem.set('troubl')
      expect(pstem.step_1b1).to eq 'trouble'
    end
    it "siz => size" do
      pstem.set('siz')
      expect(pstem.step_1b1).to eq 'size'
    end
    it "stubb => stub" do
      pstem.set('stubb')
      expect(pstem.step_1b1).to eq 'stub'
    end
    it "hudd => hud" do
      pstem.set('hudd')
      expect(pstem.step_1b1).to eq 'hud'
    end
    it "stuff => stuf" do
      pstem.set('stuff')
      expect(pstem.step_1b1).to eq 'stuf'
    end
    it "zugg => zug" do
      pstem.set('zugg')
      expect(pstem.step_1b1).to eq 'zug'
    end
    it "humm => hum" do
      pstem.set('humm')
      expect(pstem.step_1b1).to eq 'hum'
    end
    it "tann => tan" do
      pstem.set('tann')
      expect(pstem.step_1b1).to eq 'tan'
    end
    it "hopp => hop" do
      pstem.set('hopp')
      expect(pstem.step_1b1).to eq 'hop'
    end
    it "hurr => hur" do
      pstem.set('hurr')
      expect(pstem.step_1b1).to eq 'hur'
    end
    it "troubl => trouble" do
      pstem.set('troubl')
      expect(pstem.step_1b1).to eq 'trouble'
    end
    it "statt => stat" do
      pstem.set('statt')
      expect(pstem.step_1b1).to eq 'stat'
    end
    it "goww => gow" do
      pstem.set('goww')
      expect(pstem.step_1b1).to eq 'gow'
    end
    it "zuxx => zux" do
      pstem.set('zuxx')
      expect(pstem.step_1b1).to eq 'zux'
    end
    it "fail => fail" do
      pstem.set('fail')
      expect(pstem.step_1b1).to eq 'fail'
    end
    it "fil => file" do
      pstem.set('fil')
      expect(pstem.step_1b1).to eq 'file'
    end
  end

  describe "2 단계" do
    it 'relational => relate' do
      pstem.set('relational')
      expect(pstem.step_2).to eq 'relate'
    end
    it 'conditional => condition' do
      pstem.set('conditional')
      expect(pstem.step_2).to eq 'condition'
    end
    it 'valenci => valence' do
      pstem.set('valenci')
      expect(pstem.step_2).to eq 'valence'
    end
    it 'hesitanci => hesitance' do
      pstem.set('hesitanci')
      expect(pstem.step_2).to eq 'hesitance'
    end
    it 'digitizer => digitize' do
      pstem.set('digitizer')
      expect(pstem.step_2).to eq 'digitize'
    end
    it 'conformabli => conformable' do
      pstem.set('conformabli')
      expect(pstem.step_2).to eq 'conformable'
    end
    it 'radicalli => radical' do
      pstem.set('radicalli')
      expect(pstem.step_2).to eq 'radical'
    end
    it 'differentli => different' do
      pstem.set('differentli')
      expect(pstem.step_2).to eq 'different'
    end
    it 'vileli => vile' do
      pstem.set('vileli')
      expect(pstem.step_2).to eq 'vile'
    end
    it 'analogousli => analogous' do
      pstem.set('analogousli')
      expect(pstem.step_2).to eq 'analogous'
    end
    it 'vietnamization => vietnamize' do
      pstem.set('vietnamization')
      expect(pstem.step_2).to eq 'vietnamize'
    end
    it 'predication => predicate' do
      pstem.set('predication')
      expect(pstem.step_2).to eq 'predicate'
    end
    it 'operator => operate' do
      pstem.set('operator')
      expect(pstem.step_2).to eq 'operate'
    end
    it 'feudalism => feudal' do
      pstem.set('feudalism')
      expect(pstem.step_2).to eq 'feudal'
    end
    it 'decisiveness => decisive' do
      pstem.set('decisiveness')
      expect(pstem.step_2).to eq 'decisive'
    end
    it 'hopefulness => hopeful' do
      pstem.set('hopefulness')
      expect(pstem.step_2).to eq 'hopeful'
    end
    it 'callousness => callous' do
      pstem.set('callousness')
      expect(pstem.step_2).to eq 'callous'
    end
    it 'formaliti => formal' do
      pstem.set('formaliti')
      expect(pstem.step_2).to eq 'formal'
    end
    it 'sensitiviti => sensitive' do
      pstem.set('sensitiviti')
      expect(pstem.step_2).to eq 'sensitive'
    end
    it 'sensibiliti => sensible' do
      pstem.set('sensibiliti')
      expect(pstem.step_2).to eq 'sensible'
    end
  end

  describe "3 단계" do
    it 'triplicate => triplic' do
      pstem.set('triplicate')
      expect(pstem.step_3).to eq 'triplic'
    end
    it 'formative => form' do
      pstem.set('formative')
      expect(pstem.step_3).to eq 'form'
    end
    it 'formalize => formal' do
      pstem.set('formalize')
      expect(pstem.step_3).to eq 'formal'
    end
    it 'electriciti => electric' do
      pstem.set('electriciti')
      expect(pstem.step_3).to eq 'electric'
    end
    it 'electrical => electric' do
      pstem.set('electrical')
      expect(pstem.step_3).to eq 'electric'
    end
    it 'hopeful => hope' do
      pstem.set('hopeful')
      expect(pstem.step_3).to eq 'hope'
    end
    it 'goodness => good' do
      pstem.set('goodness')
      expect(pstem.step_3).to eq 'good'
    end
  end

  describe "4 단계" do
    it 'revival => reviv' do
      pstem.set('revival')
      expect(pstem.step_4).to eq 'reviv'
    end
    it 'allowance => allow' do
      pstem.set('allowance')
      expect(pstem.step_4).to eq 'allow'
    end
    it 'inference => infer' do
      pstem.set('inference')
      expect(pstem.step_4).to eq 'infer'
    end
    it 'airliner => airlin' do
      pstem.set('airliner')
      expect(pstem.step_4).to eq 'airlin'
    end
    it 'gyroscopic => gyroscop' do
      pstem.set('gyroscopic')
      expect(pstem.step_4).to eq 'gyroscop'
    end
    it 'adjustable => adjust' do
      pstem.set('adjustable')
      expect(pstem.step_4).to eq 'adjust'
    end
    it 'defensible => defens' do
      pstem.set('defensible')
      expect(pstem.step_4).to eq 'defens'
    end
    it 'irritant => irrit' do
      pstem.set('irritant')
      expect(pstem.step_4).to eq 'irrit'
    end
    it 'replacement => replac' do
      pstem.set('replacement')
      expect(pstem.step_4).to eq 'replac'
    end
    it 'adjustment => adjust' do
      pstem.set('adjustment')
      expect(pstem.step_4).to eq 'adjust'
    end
    it 'dependent => depend' do
      pstem.set('dependent')
      expect(pstem.step_4).to eq 'depend'
    end
    it 'curorusion => curorus' do
      pstem.set('curorusion')
      expect(pstem.step_4).to eq 'curorus'
    end
    it 'adoption => adopt' do
      pstem.set('adoption')
      expect(pstem.step_4).to eq 'adopt'
    end
    it 'homologou => homolog' do
      pstem.set('homologou')
      expect(pstem.step_4).to eq 'homolog'
    end
    it 'communism => commun' do
      pstem.set('communism')
      expect(pstem.step_4).to eq 'commun'
    end
    it 'activate => activ' do
      pstem.set('activate')
      expect(pstem.step_4).to eq 'activ'
    end
    it 'angulariti => angular' do
      pstem.set('angulariti')
      expect(pstem.step_4).to eq 'angular'
    end
    it 'homologous => homolog' do
      pstem.set('homologous')
      expect(pstem.step_4).to eq 'homolog'
    end
    it 'effective => effect' do
      pstem.set('effective')
      expect(pstem.step_4).to eq 'effect'
    end
    it 'bowdlerize => bowdler' do
      pstem.set('bowdlerize')
      expect(pstem.step_4).to eq 'bowdler'
    end
  end

  describe "5a 단계" do
    it 'probate => probat' do
      pstem.set('probate')
      expect(pstem.step_5a).to eq 'probat'
    end
    it 'rate => rate' do
      pstem.set('rate')
      expect(pstem.step_5a).to eq 'rate'
    end
    it 'cease => ceas' do
      pstem.set('cease')
      expect(pstem.step_5a).to eq 'ceas'
    end
  end
  
end

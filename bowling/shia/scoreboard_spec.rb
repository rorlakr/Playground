require './scoreboard'

RSpec.describe Scoreboard do
  context "with [3]" do
    it "#now_frame started with 1" do
      scoreboard = Scoreboard.new
      expect(scoreboard.now_frame).to eq(1)
    end

    it "#score started with 0" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(3)
      expect(scoreboard.score).to eq(0)
    end

    it "#throw_ball should return true util game is finish" do
      scoreboard = Scoreboard.new
      expect(scoreboard.throw_ball(3)).to eq(true)
    end
  end

  context "with [3,4]" do
    it "#now_frame is to be 2" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(3)
      scoreboard.throw_ball(4)
      expect(scoreboard.now_frame).to eq(2)
    end

    it "#score should be 7" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(3)
      scoreboard.throw_ball(4)
      expect(scoreboard.score).to eq(7)
    end
  end

  context "with [5,5]" do
    it "#now_frame is to be 2" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(5)
      scoreboard.throw_ball(5)
      expect(scoreboard.now_frame).to eq(2)
    end

    it "#score should be 0" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(5)
      scoreboard.throw_ball(5)
      expect(scoreboard.score).to eq(0)
    end
  end

  context "with [3,4,5]" do
    it "#now_frame is to be 2" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(3)
      scoreboard.throw_ball(4)
      scoreboard.throw_ball(5)
      expect(scoreboard.now_frame).to eq(2)
    end

    it "#score should be 7" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(3)
      scoreboard.throw_ball(4)
      scoreboard.throw_ball(5)
      expect(scoreboard.score).to eq(7)
    end
  end

  context "with [4,6,1]" do
    it "#now_frame is to be 2" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(4)
      scoreboard.throw_ball(6)
      scoreboard.throw_ball(1)
      expect(scoreboard.now_frame).to eq(2)
    end

    it "#score should be 11" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(4)
      scoreboard.throw_ball(6)
      scoreboard.throw_ball(1)
      expect(scoreboard.score).to eq(11)
    end
  end

  context "with [10,3]" do
    it "#now_frame is to be 2" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(10)
      scoreboard.throw_ball(3)
      expect(scoreboard.now_frame).to eq(2)
    end

    it "#score should be 0" do
      scoreboard = Scoreboard.new
      scoreboard.throw_ball(10)
      scoreboard.throw_ball(3)
      expect(scoreboard.score).to eq(0)
    end
  end

  context "with [10,10,10,10,10,10,10,10,10,10,10,10]" do
    it "#now_frame is to be 11" do
      scoreboard = Scoreboard.new
      scoreboard.throw_balls([10,10,10,10,10,10,10,10,10,10,10,10])
      expect(scoreboard.now_frame).to eq(11)
    end

    it "#score should be 300" do
      scoreboard = Scoreboard.new
      scoreboard.throw_balls([10,10,10,10,10,10,10,10,10,10,10,10])
      expect(scoreboard.score).to eq(300)
    end

    it "#throw_ball should return false after game is finish" do
      scoreboard = Scoreboard.new
      scoreboard.throw_balls([10,10,10,10,10,10,10,10,10,10,10,10])
      expect(scoreboard.throw_ball(3)).to eq(false)
    end
  end

  context "with [10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3]" do
    it "#now_frame is to be 11" do
      scoreboard = Scoreboard.new
      scoreboard.throw_balls([10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3])
      expect(scoreboard.now_frame).to eq(11)
    end

    it "#score should be 300" do
      scoreboard = Scoreboard.new
      scoreboard.throw_balls([10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3])
      expect(scoreboard.score).to eq(161)
    end

    it "#throw_ball should return false after game is finish" do
      scoreboard = Scoreboard.new
      scoreboard.throw_balls([10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3])
      expect(scoreboard.throw_ball(3)).to eq(false)
    end
  end
end
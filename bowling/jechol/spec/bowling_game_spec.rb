require_relative '../bowling_game.rb'

describe BowlingGame do
  specify do
    data = [[10,0],[10,0],[10,0],[8,2],[7,3],[9,1],[7,2],[3,0],[7,2],[6,0],[3,0],[0,0]]
    expect(BowlingGame.score(data)).to eq 161
  end

  specify do
    data = [[7,0],[9,1],[9,1],[7,2],[10,0],[9,1],[9,1],[9,1],[9,0],[10,0],[9,0],[1,0]]
    expect(BowlingGame.score(data)).to eq 158
  end
end

describe RoundScore do
  specify '[10, 0], [10, 0], [8, 1]' do
    round_scores = RoundScore.build [[10, 0], [10, 0], [8, 1]]
    expect(round_scores[0].sum).to eq 10
    expect(round_scores[1].sum).to eq 10
    expect(round_scores[2].sum).to eq 9
    expect(round_scores.first.score_include_bonus).to eq 28
  end
end

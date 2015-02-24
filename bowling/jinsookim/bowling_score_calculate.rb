# Playground : Bowling Record
# Programmed by Jinsoo Kim
# 2015.01.27(화) 

# 볼링게임 입력값
$input = [
	[4, 5],   # 1frame
	[9, 1],   # 2frame
	[10,0],   # 3frame
	[10,0],   # 4frame
	[0, 7],   # 5frame
	[5, 5],   # 6frame
	[10,0],   # 7frame
	[6, 3],   # 8frame
	[10,0],   # 9frame
	[10,0],   # 10frame
	[10,0],   # 11frame
	[10,0]    # 12frame
]

# 프레임별 구분
def judge_frame(num1, num2)
	if num1 == 10
	    "Strike"
	elsif num1+num2 == 10
		"Spare"
	else
		"Open"
	end
end

# 볼링게임 점수결과
$total_score = 0

# 볼링게임 클래스
class Game
	attr_reader :frames

	def initialize(arr)
		@frames = arr
	end

	def score
		total_score = 0

		(0..9).each do |index|
			frame = @frames[index]
			next_frame  = @frames[index+1]
			nnext_frame = @frames[index+2]

			judge_code = judge_frame(frame[0], frame[1])

			# 프레임별 점수
			frame_score = 0

			case judge_code
				when "Strike" 
					if @frames[index+1][0] == 10
						frame_score = 10 + next_frame[0] + nnext_frame[0] 
					else
						frame_score = 10 + next_frame[0] + next_frame[1]
					end

				when "Spare"
					frame_score = 10 + @frames[index+1][0] 

				when "Open"
					frame_score = frame[0] + frame[1]
			end

			printf("%dframe : %d, %d --> %s \n", index+1, frame[0], frame[1], judge_code)

			total_score += frame_score 
		end

		total_score
	end
end

$game = Game.new($input)

printf("Total Score : %d \n", $game.score)

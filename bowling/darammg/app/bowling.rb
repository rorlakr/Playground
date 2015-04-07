class Bowling
  STRIKE = "STRIKE"
  SPARE = "SPARE"
  NONE = "NONE"
  
  def initialize
    @past_past_status = NONE
    @past_status = NONE
    @current_status = NONE
    @total_score = 0
    @current_frame_input = []
    @frame_number = 1
  end
  
  def start_scoring(inputs)
    inputs.each do |input|
      total_score_calcurate(input)
    end
    get_total_score
  end
  
  
  def get_total_score
    @total_score
  end
  
  def total_score_calcurate(input)
    if @current_frame_input.length == 0 #첫 번째 시도
      if input == 10 #스트라이크
        @current_status = STRIKE
        @current_frame_input = [10, 0]
      else
        @current_frame_input.push(input)
      end
    else #두 번째 시도. 즉 스트라이크는 물건너감
      @current_frame_input.push(input)
      if @current_frame_input.inject(:+) == 10 #스페어
        @current_status = SPARE
      else
        @current_status = NONE
      end
    end
    
    if @current_frame_input.length == 2 # 프레임이 끝남.
      past_past_score = get_past_past_frame_score(@current_frame_input)
      past_score = get_past_frame_score(@current_frame_input)
      current_score = get_current_frame_score(@current_frame_input)
      p "total_score : past_total_score(#{@total_score.to_s}) + past_past_frame_score(#{past_past_score.to_s}) + past_frame_score(#{past_score.to_s}) + current_frame_score(#{current_score.to_s})"
      @total_score = @total_score + past_past_score + past_score + current_score 
      @past_past_status = @past_status
      @past_status = @current_status
      @current_frame_input = []
      
      p @frame_number.to_s + " frame end. total_score : " + @total_score.to_s
      @frame_number += 1
    end
  end
  
  def get_past_past_frame_score(current_frame_input)
    past_past_score = 0
    past_past_score = 20 + current_frame_input[0] if @past_past_status == STRIKE && @past_status == STRIKE
    past_past_score 
  end
  
  def get_past_frame_score(current_frame_input)
    past_score = 0
    if @past_status == STRIKE && @current_status != STRIKE
      past_score = 10 + current_frame_input.inject(:+)
    elsif @past_status == SPARE
      past_score = 10 + current_frame_input[0]
    end
    past_score
  end
  
  def get_current_frame_score(current_frame_input)
    current_score = 0
    current_score = current_frame_input.inject(:+) if @current_status == NONE
    current_score
  end
end

require 'school'

describe School do
  # describe '.whoIsNext' do
  #   let(:people) { ['철수', '민호', '수지', '효성', '지수'] }
  #   shared_examples 'expectation' do |nth, person|
  #     specify do
  #       expect(described_class.whoIsNext(people, nth)).to eq person
  #     end
  #   end

  #   it_behaves_like 'expectation', 1, '철수'
  #   it_behaves_like 'expectation', 52, '수지'
  #   it_behaves_like 'expectation', 7230702951, '민호'
  # end
  describe '.select_school' do
    # let(:students) { [[3,7],[2,2],[14,1]] }
    # let(:locations) { [{"id"=> 1, "x"=> 3, "y"=> 4}, {"id"=> 2, "x"=> 8, "y"=> 2}] }
    it 'should return 1' do
      expect(described_class.select_school([[3,7],[2,2],[14,1]], [{"id"=> 1, "x"=> 3, "y"=> 4}, {"id"=> 2, "x"=> 8, "y"=> 2}])).to eq 1
    end

    it 'should returns ...' do
      s = [[54,7],[1,211],[14,44],[12,5],[14,7]]
      l = [{"id"=> 1, "x"=> 44, "y"=> 55}, {"id"=> 2, "x"=> 12, "y"=> 57},{"id"=> 3, "x"=> 23, "y"=> 66}] 
      expect(described_class.select_school(s, l)).to eq 2 
      
      s = [[152,7],[1,211],[14,56],[12,4],[142,7]]
      l = [{"id"=> 1, "x"=> 63, "y"=> 55}, {"id"=> 2, "x"=> 55, "y"=> 21},{"id"=> 3, "x"=> 144, "y"=> 12}] 
      expect(described_class.select_school(s, l)).to eq 2
      
      s = [[152, 742], [466, 2211], [1412, 564], [142, 444], [142, 744]]
      l = [{"id"=>1, "x"=>1263, "y"=>525}, {"id"=>2, "x"=>55, "y"=>21}, {"id"=>3, "x"=>537, "y"=>1244}] 
      expect(described_class.select_school(s, l)).to eq 3
      
      s = [[7, 66], [71, 7], [0, 94], [16, 93], [33, 49], [49, 81], [17, 2], [95, 71], [32, 14], [31, 41], [92, 72], [12, 79]]
      l = [{"y"=>38, "x"=>32, "id"=>1}, {"y"=>49, "x"=>73, "id"=>2}, {"y"=>85, "x"=>50, "id"=>3}, {"y"=>2, "x"=>79, "id"=>4}, {"y"=>20, "x"=>44, "id"=>5}, {"y"=>56, "x"=>17, "id"=>6}, {"y"=>43, "x"=>26, "id"=>7}, {"y"=>61, "x"=>89, "id"=>8}, {"y"=>18, "x"=>15, "id"=>9}, {"y"=>34, "x"=>41, "id"=>10}, {"y"=>27, "x"=>99, "id"=>11}] 
      expect(described_class.select_school(s, l)).to eq 6
    end
  end
  describe '.distance' do
    it 'should return 3' do
      expect(described_class.distance({"id"=> 1, "x"=> 3, "y"=> 4}, [3,7])).to eq 3
    end
    it 'should return 14' do
      expect(described_class.distance({"id"=> 1, "x"=> 3, "y"=> 4}, [14,1])).to eq 14
    end
  end
  describe '.sum_distances_to_location(a_location, students)' do
    it 'should return 1' do
      expect(described_class.sum_distances_to_location({"id"=> 1, "x"=> 3, "y"=> 4}, [[3,7]])).to eq 3
    end
  end
end

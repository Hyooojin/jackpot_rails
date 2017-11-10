class LottoController < ApplicationController
  
  
  def index
  end

  def show
    @lotto = (1..45).to_a.sample(6)
  end
  
  
  
  def api
    require 'httparty'
    require 'json'
    
    @lotto = [*1..45].sample(6)
    # @lotto = []19, 12, 6, 41, 34, 4] #테스트 코드
  
  
    uri = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
    response = HTTParty.get(uri)
    result = JSON.parse(response.body)      # puts result
    
    
    @arr = Array.new
    @bonus_number = result['bnusNo']
    
    result.each do |key, value|
    @arr << value if key.include? "drwtNo"
    end
    # arr = [] # api로 가져온 이번주 당첨 코드
    # lotto 담긴 숫자와 arr안에 담긴 숫자를 비교
    # 6개 다 맞으면 1등
    # 5개 맞으면 2등
    # 4개 맞으면 3등
    # 3개 맞으면 4등
    # 2개 맞으면 5등
    # 1개 맞으면 6등
    
    # "lotto 담긴 숫자와 arr 안에 담긴 숫자를 비교"
    # @matching = arr & lotto
    
    
    
    @matching = @arr & [19, 12, 6, 41, 34, 2] #@lotto 
    # [19, 12, 6, 41, 34, 2] #테스트용
    # @lotto                # 실제용
    
    @counting = @matching.length
    
   
   
    if @counting == 6
      @result = "1등(15억)"
    elsif @counting  == 5 && @lotto.include?(@bonus_number) # plus가 포함해서 맞으면, .. 우리 추천 번호에 bonus가 있니?
      @result = "2등(4천만원)"
    elsif @counting  == 5
      @result = "3등(120만원)"
    elsif @counting  == 4
      @result = "4등(5만원)"
    elsif @counting  == 3
      @result = "5등(5천원)"
    elsif @counting  == 2
      @result = "꽝"
    else 
      @result = "꽝"
    end
    
  end
  
end

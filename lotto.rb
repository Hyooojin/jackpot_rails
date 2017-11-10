require 'httparty'
require 'json'

lotto = [*1..45].sample(6) # *을 붙이면 array가 되므로 .sample
puts lotto

uri = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=644"
response = HTTParty.get(uri)
result = JSON.parse(response.body)
# puts result

arr = Array.new



#method1
# arr[0] = result["drwtNo1"]
# arr[1] = result["drwtNo2"]
# arr[2] = result["drwtNo3"]
# arr[3] = result["drwtNo4"]
# arr[4] = result["drwtNo5"]
# arr[5] = result["drwtNo6"]

#method2
# arr <<  result["drwtNo1"]
# arr <<  result["drwtNo2"]
# arr << result["drwtNo3"]
# arr << result["drwtNo4"]
# arr << result["drwtNo5"]
# arr << result["drwtNo6"]

# puts arr

#method3
# 6.times do |i|
#     arr << result["drwNo#{i+1}"] #{i+1} 대신, {i.next}사용가능
# end
# puts arr

#method4
# result.each do |key, value|
#     if key.includ? "drwtNo"
#         arr << value
#     end
    
# end

# method5
result.each do |key, value|
    arr << value if key.include? "drwtNo"
end
# puts arr.sort
puts arr

# matcharr = arr & lotto 
puts (arr & lotto).length 
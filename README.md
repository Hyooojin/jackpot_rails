# API를 사용한 로또번호 추천 받기!

### 환경설정

  *  controller 설치

  *  Jason viewer chrome 확장판 설치
     [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh/related)
     [JSON Open source](https://goo.gl/fmphc7)

     The most beautiful and customizable JSON/JSONP highlighter that your eys have ever seen.

  *  Lotto API
     [Lotto API 홈페이지](https://jackpot-hyooojin.c9users.io/)

```ruby
$ rails g controller lotto index show
$ gem install httparty
$ gem install nokogiri
$bundle install
```





## veiw

1. controller : lotto
2. lotto#index : 루트페이지
3. lotto#index :버튼(로또번호추천)
4. lotto#show : 로또번호추천
5. lotto#api : 로또 번호를 가져와서, array에 넣는다.

## 

## contorller

```ruby
- def api
    JSON.parse()
    # 해당하는 정보를 배열에 넣어준다.
    
    
    
    lotto = [*1..45].sample(6)
    arr = [] # api로 가져온 이번주 당첨 코드
    # lotto 담긴 숫자와 arr안에 담긴 숫자를 비교
    # 6개 다 맞으면 1등
    # 5개 맞으면 2등
    # 4개 맞으면 3등
    # 3개 맞으면 4등
    # 2개 맞으면 5등
    # 1개 맞으면 6등
    
 end
```


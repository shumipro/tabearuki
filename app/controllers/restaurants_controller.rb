class RestaurantsController < ApplicationController
  def index
    # いったん決め打ちで返す
    @restaurants = [
      Restaurant.new(
        name: '箱根自然薯 山そば',
        description: '石臼で丁寧に挽いた国産そば粉を、箱根の名水で打つそば店。',
        image_url: 'http://uds.gnst.jp/rest/img/2kad9mpf0000/s_0010.jpg?t=1371405413'
      ),
      Restaurant.new(
        name: '知客茶家 箱根湯本',
        description: '箱根名物”早雲豆腐”をご賞味ください。囲炉裏の席など非日常空間も味わえます。',
        image_url: 'http://uds.gnst.jp/rest/img/m4bwg0pa0000/s_0016.jpg?t=1427293154'
      ),
      Restaurant.new(
        name: '網元 おおば',
        description: '縁結びでお馴染みの九頭竜神社に近い漁師のお店、オーナー自ら漁に出て捕った湖水魚を料理してくれる。',
        image_url: 'http://uds.gnst.jp/rest/img/83s9g0sd0000/s_001f.jpg?t=1377332341'
      )
    ]
  end
end

class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ファッション' },
    { id: 3, name: 'ベビー・キッズ' },
    { id: 4, name: 'ゲーム・おもちゃ・グッズ' },
    { id: 5, name: 'ホビー・楽器・アート' },
    { id: 6, name: 'チケット' },
    { id: 7, name: '本・雑誌・漫画' },
    { id: 8, name: 'CD・DVD・ブルーレイ' },
    { id: 9, name: 'スマホ・タブレット・パソコン' },
    { id: 10, name: 'テレビ・オーディオ・カメラ' }
    { id: 11, name: '生活家電・空調' },
    { id: 12, name: 'スポーツ' },
    { id: 13, name: 'アウトドア・釣り・旅行用品' },
    { id: 14, name: 'コスメ・美容' },
    { id: 15, name: '食品・飲料・酒' },
    { id: 16, name: 'キッチン・日用品・その他' },
    { id: 17, name: '家具・インテリア' },
    { id: 18, name: 'ペット用品' },
    { id: 19, name: 'DIY・工具' },
    { id: 21, name: 'フラワー・ガーデニング' },
    { id: 22, name: 'ハンドメイド・手芸' },
    { id: 23, name: '車・バイク・自転車' }
  ]

  include ActiveHash::Associations
  has_many :items
  end
##開発環境  
  
Mac OS Catalina 10.15.6  
Visual Studio Code （エディタ）  

言語: Ruby 2.6.2  
FW: Ruby on rails 6.0.3.3  
DB: PostgreSQL  
デプロイ環境: Heroku  
テストフレームワーク: RSpec (+FactoryBot)  
Docker    

Google Chrome, Safariで動作確認済み  


  
##サービス概要  
  
「オンライン飲み会」をする人が増えている中、コンビニやスーパーで買えるお酒の情報共有サイトがあれば便利だと考え、  
制作しました。  
飲んだお酒についての評価を投稿したり、自宅での飲み方を写真で共有することができます。  
  
##実装した機能  
  
deviceによる認証機能  
Twitter APIによる認証  
ユーザーマイページ機能  
relationモデルによるフォロー機能  
投稿機能 + Cloudinaryによる写真投稿  
Gem(kaminari)を使用したページネーション機能  
投稿にいいね・コメントが付けられる機能  
スマートフォンでの表示に対応したレスポンシブCSS    

##ゲストログイン  
email: guest@example  
password: guest0000
  
##heroku URL  
https://gokugoku.herokuapp.com/  

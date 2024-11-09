## 開発環境

- Ruby 3.3.2
- Ruby on Rails 7.2.2
- PostgreSQL

## サービス概要

「オンライン飲み会」をする人が増えている中、コンビニやスーパーで買えるお酒の情報共有サイトがあれば便利だと考え、
制作しました。

飲んだお酒についての評価を投稿したり、自宅での飲み方を写真で共有することができます。

## 実装した機能

- deviceによる認証機能
- Twitter APIによる認証
- ユーザーマイページ機能
- ユーザー同士のフォロー機能
- 投稿機能 + Cloudinaryによる写真投稿
- 投稿にいいね・コメントが付けられる機能
- スマートフォンでの表示に対応したレスポンシブCSS

## アプリケーション起動

```sh
docker-compose build

docker-compose up -d

docker-compose run web rake db:migrate
```

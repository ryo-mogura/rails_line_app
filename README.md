# PantryChefNotifier(- 食材管理とレシピ提示アプリ -)
## サービスURL
https://pantry-chef-notifier.onrender.com
## サービス概要
消費・賞味期限が近い食材と、その食材を使用したレシピを通知してくれるアプリです。
## Webアプリを開発するに至った経緯
一人暮らしをしている中で、以下の問題に直面したことがありました。
- 以前購入した食材を忘れ、同じ食材を再び購入してしまうことが度々ありました。その結果、冷蔵庫や冷凍庫が不要な食材で溢れかえり管理が難しくなりました。
- 購入した食材の消費期限を把握しきれず期限を過ぎてしまい、廃棄せざるを得ないことが多くありました。これにより無駄な出費が増え、食材の無駄遣いが続いていました。
- 冷凍庫に保存していた魚や肉類が、いつ保存したものか分からなくなることが頻繁にありました。そのため、食材の鮮度や品質が不明なまま使用することになり、安全にも不安が生じていました。
- 消費期限が近い食材を使って料理をする際に、適したレシピを探すのが面倒に感じることもありました。毎回レシピを探す手間が増え、料理をするモチベーションが低下することもありました。

これらの問題を解決し、食材の管理を効率化するために、消費期限の管理やレシピの検索を容易にするWebアプリを開発するに至りました。
## 想定されるユーザー層
- 一人暮らしをしている人
- 忙しい毎日を過ごしている人
- 冷蔵庫の管理・料理をしている人
## サービスの利用イメージ
レスポンシブ対応を実装することでスマホ、PC どちらからでも使うことができます。

ユーザーは食材を登録することで冷蔵庫の中身を可視化することができます。
また冷蔵庫を確認しなくてもLine通知によって食材の消費・賞味期限を把握することができます。
## ユーザーの獲得について
- Xを用いた宣伝
- Qiitaの開発記事による宣伝
## サービスの差別化ポイント・推しポイント
ほとんどの方が使用しているLineから期限が近い食材のリストとその食材を使用したレシピを通知で教えてくれる点。
Lineとの対話形式で操作できるので直感的に操作しやすい点。
## 実装を予定している機能
### MVP
- ユーザー登録
  - メール・パスワード
  - Lineログイン
- アカウント
  - プロフィール
- 食材リスト
  - 登録
  - 編集（詳細ページで行う）
  - 削除
  - ソート (消費期限順、名前順)
- Line通知(AM:8:00に通知が来るように設定)
  - 消費期限が２日以内の食材のリスト
  - 消費期限が２日以内の食材を使用したレシピ
- LineBotとの対話機能
  - 食材リストの取得
  - 消費期限リストの取得
  - レシピ検索
### 本リリース
- 食材のカテゴリー機能
- LineBotとの対話機能
  - 食材の登録
  - レシピのお気に入り機能
## 技術スタック
### 以下予定している技術スタックです
| カテゴリー | 技術スタック |
| ---- | ---- |
| Frontend | Rails 7.1.3.2 (Hotwire/Turbo/Stimulus), TailwindCSS, DaisyUI　 |
| Backend | Rails 7.1.3.2 (Hotwire/Turbo/Stimulus) |
| Database | PostgreSQL |
| Environment | Docker / docker-compose |
| Infrastructure | Render.com |
| other | [Line Messaging API](https://github.com/line/line-bot-sdk-ruby), [Rakuten_web_service API](https://github.com/rakuten-ws/rws-ruby-sdk/blob/master/README.ja.md) |

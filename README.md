# README

# アプリの名前  
  ワクチン登録アプリケーション(Vaccination_Registration)  

## 概要  
  ワクチン接種者の登録と接種者数のリアルタイム表示ができます。
  ワクチンを接種する人たち（ユーザー）は事前に個人情報を登録し、アプリケーションが自動的に個人番号を生成します。会場の担当者（別画面からログインするユーザー）がフォームへこの個人番号を入力しボタンを押し、接種済みの登録をします。また、リアルタイムで登録者数が表示出来ます。
  あえて一つのアプリケーションに2つの機能を実装することにより実際の現場で発生する費用を抑え、顧客の予算をよりかなえやすくすることが出来ます。
  
## 本番環境(デプロイ先 テストアカウントとID)  
  デプロイ先: (AWSの予定です)
  テストアカウント:ユーザー（ワクチン接種者） メールアドレス:test2@com パスワード:123456b
                        (会場登録担当者)  メールアドレス:test1@com パスワード:123456a
  
## DEMO
  ユーザー登録場面(個人番号生成画面):https://gyazo.com/768a56e8a46328c02114a89450bb8c58.gif
  マイページでの個人情報の編集場面:https://gyazo.com/30648550514b3f4188d3c1cfab4bb69c.gif / https://gyazo.com/27593ea348919546d44d00c1b910052d.gif
  個人番号の登録場面:
  ユーザー登録についてのテストコード:https://gyazo.com/9cc900fe341e2869cc7a75bfcf5fbd4e.gif

## 制作背景(意図)
  新型コロナウィルスのワクチン接種をした人の登録が非効率的であり、課題になっていることを知りました。会場で担当者が接種した人の個人情報を一人ずつ登録しており、これが原因で接種済みの人の正確な数がわかり辛いようです。
  この課題が、今回このアプリケーションを制作した背景です。
  国内の経済を安定させるために、新型コロナウィルスのワクチン接種は必須です。その管理をするアプリケーションは、どんな人にも使いやすいものにしたいという思いでデザインをしました。

## 工夫したポイント
  * シンプルな配置により、直感的に操作が出来るようにしました。
  * 文字を大きくし、誰でも見やすく表示しました。
  * エラーメッセージを日本語化しました。

## 今後の課題や実装したい機能
  * 新規登録画面をウィザード式にする  
  * お問い合わせフォームの実装(自動AI)
  * レスポンシブ対応にする（pc以外からも登録しやすくする）
  * Twitterと連携し、ワクチン接種についてのツイートをリアルタイムに表示する
  * セキュリティを強化する
  * 番号登録の機能をJava Scriptで実装する(非同期通信の実装)


## DB設計
  


## users テーブル

| Column                        | Type     | Options                  |
| ----------------------------- | -------- | ------------------------ |
| name                          | string   | null: false              |
| name_reading                  | string   | null: false              |
| encrypted_password            | string   | null: false              |
| address                       | text     | null: false              |
| phone_number                  | string   | null: false              |
| email                         | string   | null: false, unique: true|
| datetime                      | date     | null: false              |
| blood_type_id                 | integer  | null: false              |
| body_weight                   | integer  | null: false              |
| height                        | integer  | null: false              |
| body_temperature              | integer  | null: false              |
| allergy_id                    | integer  | null: false              |
| chronic_condition_id          | integer  | null: false              |
| venue_id                      | integer  | null: false              |
| public_uid                    | string   | null: false, unique: true|


### Association
has_one :registration


## registrations テーブル

| Column                        | Type       | Options                  | 
| ----------------------------- | ---------- | -------------------------|
| user                          | references | foreign_key: true        |    



### Association
belongs_to :users
### アプリケーション名
contact-app


### アプリケーション概要
- 幼稚園や保育園の先生と保護者が連絡をリアルタイムで行う事ができる


### アプリケーションURL
https://contact-app-33028.herokuapp.com/


### アプリケーション名
テスト用アカウント(先生)
| Login    | E-mail      | Password    | 仮の組名 |
| -------- | ----------- | ----------  | ------- |
| A先生　   | asensei@com | asensei1111 | ひよこぐみ |
| B先生　   | bsensei@com | bsensei1111 | りすぐみ  |
| C先生　   | csensei@com | csensei1111 | うさぎぐみ |
| D先生　   | dsensei@com | dsensei1111 | きりんぐみ |



### 利用方法
- 先生側
1. 先生用のアカウントは作成済みなのでE-mailとpasswordを打ち込みログイン
2. 先生用のアカウントのみ受け持ちの組の名前を変更可能
3. 自分の受け持っている組の名前を画面左から選択
4. チャット画面に入ったら連絡事項などを入力

- 保護者側
1. Sign upから新規アカウント作成
2. 画面左側のルーム選択画面で自分の子供の組を選択
3. チャット画面に入ったら先生の連絡に対しての質問事項などを入力

- 共通部分
1. 画面左上のアカウント名をクリックするとアカウント名及びE-mail編集画面へ遷移
2. アカウント編集画面でログアウトができる


### 課題解決
幼稚園や保育園の先生と保護者との連絡手段として現在は紙媒体で連絡が行われている。  
書き方によってはどういう意味なのか先生の意図を汲み取れない場合や  
必須事項を掲載しないまま保護者にプリントを渡してしまった場合などにどうする事もできないのが現状なので  
先生側からの連絡や保護者側からの質問をする事ができ、上記の煩わしさを払拭したいと思った。


### 洗い出した要件
| 実装機能             | 要件                                      |
| ------------------- | ---------------------------------------- |
| ユーザー管理機能       | ・ユーザーの新規登録                          |
|                     | ・ユーザーが登録済みならログインできる             |
|                     | ・ユーザー登録後にユーザー情報編集可能            |
|                     | ・ログアウトできる                              |
| チャットルーム作成機能   | ・連絡を行うルームの名前を変更する事ができる         |
|                     | ・子供の組の担当先生を選択できる                 |
|写真付きメッセージ投稿機能 | ・テキストと画像が投稿できる                     |
|                     | ・投稿したテキストと画像は投稿したルームにのみ表示可能 |


### 実装機能GIF
[リアルタイムでチャットができる](https://gyazo.com/33f7ba9d7e32a7a934755a9f9569acb9)
[組の担当の先生以外はルーム編集ボタンが表示されない](https://gyazo.com/1e67de000798bab0fabb8cc6a016799f)


### 実装予定の機能
| 実装予定機能           | 要件                                        |
| -------------------- | ------------------------------------------ |
| ユーザー管理機能        | ・ユーザー編集画面でパスワードの変更ができる          |
| チャットルーム作成機能    | ・ユーザー(保護者)同士でチャットできる               |
|                       | ・保護者が作成したルームはルーム作成者が削除できる    |
| 写真付きメッセージ投稿機能 | ・画像をリアルタイムで投稿できる                    |


### データベース設計

#### usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

#### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages


#### roomsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

#### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages


#### room_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

#### Association

- belongs_to :room
- belongs_to :user


#### messagesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

#### Association

- belongs_to :room
- belongs_to :user


### 使用技術・環境
【フロントエンド】
- HTML
- CSS
- JavaScript

【バックエンド】
- Ruby 2.6.5
- Ruby on Rails Rails 6.0.3.4

【データベース】
- MySQL 5.6.50

【本番環境】
- heroku

【その他使用技術】
- Git,GitHub
- RSpec
- Rubocop
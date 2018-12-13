# Rails Tutorial 2

## Rails

- Railsのビューはロジックを置かない。全てヘルパーにする
- hoge_helperはHogeControllerに対応したビューだけに効くようにする

## Gem

```ruby
# 安全に今のバージョンのみ使いたい場合
gem "hoge", "2.1.8" # 2.1.8のみ使う

# 今後のバグ修正のみ受け入れたい場合
gem "hoge", "~> 2.1" # 2.1.0以上3.0.0未満の最新のものを使用
gem "hoge", "~> 2.1.8" # 2.1.8以上2.2.0未満の最新のものを使用

# 今後の変更は全て受け入れ最新に追従したい場合
gem "hoge"
gem "hoge", ">= 2.1.3" # 2.1.3以上の最新のものを使う
```

## Postgres

```bash
createuser -s -P postgres
psql -U postgres
create role collabfield with createdb login password 'collabfield';
```

初回は `rails db:setup` を実行

## Heroku

`heroku config` で得られるDATABASE_URLを設定するだけで繋がるようになる

ブランチをpushする

```bash
git push heroku branchname:master
```

## Git

リモートリポジトリを変更

```bash
# github(origin)
git remote set-url origin {{url}}
# heroku
git remote set-url heroku {{url}}
```

リモートリポジトリを操作する危険なコマンド

```bash
# ブランチを複製
git push origin master:master_bak

# 履歴を一つもどす
git push -f origin HEAD\^:master

# 履歴を３つ戻す
git push -f origin HEAD~3:master

# ブランチを削除
git push origin :master_bak
```

ブランチを作成してリモートにpush

```bash

# ブランチを作成

git checkout -b branchname

# リモートにpush (-uは次回からgit pushだけで勝手にorigin/branchnameにpushしてくれる)
# (git branch --set-upstream-to=origin/master を自動でやってくれる)
git push -u origin branchname
```

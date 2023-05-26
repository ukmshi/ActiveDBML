# デバッグ方法

開発者本人が、アプリが機能するか確認するためのメモ

### Gemの生成

```sh
cd root

gem build active-dbml.gemspec
```

### Gemの公開方法

1. GemをBuild
2. Gemへログイン
3. GemへPush

```sh
# 2. Gemへログイン
$ gem signin
Enter your RubyGems.org credentials.
Don't have an account yet? Create one at https://rubygems.org/sign_up
  Email:   (your-email-address@example.com)
Password:   (your password for RubyGems.org)

API Key name [host-user-20220102030405]:
Please select scopes you want to enable for the API key (y/n)
index_rubygems [y/N]:   n
push_rubygem [y/N]:   y
yank_rubygem [y/N]:   n
add_owner [y/N]:   n
remove_owner [y/N]:   n
access_webhooks [y/N]:   n
show_dashboard [y/N]:   n

You have enabled multi-factor authentication. Please enter OTP code.
Code:   123456
Signed in with API key: host-user-20220102030405.
```

```sh
$ gem push active-dbml-0.1.0.gem
Pushing gem to https://rubygems.org...
Successfully registered gem: active-dbml (0.1.0)
```

### Gemの動作を確認

```sh
# テストディレクトリに移動
$ cd test/dummy

# DBの生成
$ rake db:create
$ rake db:migrate

# Rakeタスクの動作確認
$ rake active_dbml:export
```

## 別プロジェクトで動作するかを確認する方法

exportしたgemをプロジェクトへ移動する

```sh
# gemをローカルへインストール
$ gem install --local ./active-dbml-[gem_version].gem 
```

手動でインストールした後、Gemfileを書き換える
```Gemfile
group :development, :test do
  gem 'active-dbml', '[gem_version]'
end
```

その後、bundle install


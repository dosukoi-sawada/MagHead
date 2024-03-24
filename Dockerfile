FROM ruby:3.0.4

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# ワーキングディレクトリの作成
RUN mkdir /myapp
WORKDIR /myapp

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# ホストのすべてのファイルをコンテナにコピー

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn
# Bundlerを使ってGemをインストール
RUN bundle install


COPY . /myapp

# ポート3000を公開
EXPOSE 3000

# コンテナが起動するたびにスクリプトを実行
CMD ["rails", "server", "-b", "0.0.0.0"]
# docker-simple-dovecot

docker-simple-dovecotは、シンプルなIMAPサーバーのDockerイメージです。ローカル環境でMaildirディレクトリに受信メールを格納できるようにしました。

## 使用方法

.env.defaultを.envにコピーして、自分の環境に合わせて設定してください。

    cp .env.default .env

Dockerでの起動方法は次の通りです。以下の例では、メールを格納するホームディレクトリを/srv/mail/homeのボリュームにアタッチしています。

    docker run -d -v /srv/mail/home:/home -p 143:143 -env-file .env muneando/dovecot





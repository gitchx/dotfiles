# SSH鍵の作成

## SSH設定を適用する

`ssh/.ssh/config` はGitHubに保存できる共通設定です。ホスト名、Tailscale
のIPアドレス、鍵の指定など環境固有の情報は `~/.ssh/config.private`
に置きます。このファイルは `.gitignore` で除外されています。

```bash
cd ~/dotfiles
stow -t ~ ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config.private
ssh <設定したホスト名>
```

秘密鍵、公開鍵、`known_hosts`、パスフレーズはこのリポジトリに保存しません。

## Ed25519鍵を作成する

秘密鍵はリポジトリに保存せず、ローカルの `~/.ssh` に作成します。

```bash
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519
```

`Enter passphrase` と表示されたら、秘密鍵を保護するパスフレーズを入力します。確認のため2回入力してください。

作成されるファイルは次の2つです。

- `~/.ssh/id_ed25519`: 秘密鍵。誰にも共有しない
- `~/.ssh/id_ed25519.pub`: 公開鍵。接続先サーバーやGitHubなどに登録する

秘密鍵の権限を確認・設定します。

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

## 公開鍵を接続先に登録する

サーバーへログインできる場合は、公開鍵を接続先の `authorized_keys` に追加します。

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@example.com
```

`ssh-copy-id` がない場合は、公開鍵を表示して接続先へ手動で登録します。

```bash
cat ~/.ssh/id_ed25519.pub
```

公開鍵の内容を、接続先の `~/.ssh/authorized_keys` に1行のまま追加してください。

## macOSのキーチェーンにSSH鍵のパスフレーズを保存する

macOSでは、`ssh-add` の `--apple-use-keychain` オプションを使うと、SSH鍵のパスフレーズをキーチェーンに保存できます。

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

鍵のファイル名が異なる場合は、`~/.ssh/id_ed25519` を実際の秘密鍵のパスに置き換えてください。初回実行時にパスフレーズを入力すると、以降はキーチェーンから読み込まれます。

`~/.ssh/config.private` には、SSHエージェントへの追加とキーチェーンの利用も設定しておきます。

```sshconfig
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
```

すでに登録した鍵を確認するには、次のコマンドを実行します。

```bash
ssh-add -l
```

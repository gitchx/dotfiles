### 設定ファイルをまとめています

#### symlink farm managerのGNU Stowを使ってNeovimなどの設定をコピーできます

ホームディレクトリにdotfilesリポジトリをクローンします

```bash
cd ~
git clone https://github.com/gitchx/dotfiles.git
```


Stowでシンポリックリンクを作成します。
※ コピー先のディレクトリはバックアップしてください

```bash
cd ~/dotfiles
stow -t ~ nvim
```

---

# MacBook Air 2012でnix-darwinをセットアップする


Nix 2.24.14 をインストールする
---bash
curl -L https://releases.nixos.org/nix/nix-2.24.14/install | sh
---

---bash
nix \
  --extra-experimental-features 'nix-command flakes' \
  build .#darwinConfigurations.macbook-air-2012.system
---

ビルドする場合
---bash
sudo -H darwin-rebuild switch \
  --flake ~/dotfiles/nix#macbook-air-2012
---

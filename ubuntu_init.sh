# -----------------------------------------------------
# https://gihyo.jp/admin/serial/01/ubuntu-recipe/0541
# -----------------------------------------------------
#ディレクトリ名を英語表記に
#LANG=C xdg-user-dirs-gtk-update

#CapsLockをCtrlに
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

#Dockの常時表示を無効化
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false

#Dockをウィンドウの状態に関係なく常に隠す
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

#マウスカーソルを上端にあわせるだけでDokc表示
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false

#Dockのサイズはアイコン表示に必要な分だけにする
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

#Dockのサイズは最大でも画面サイズの半分
gsettings set org.gnome.shell.extensions.dash-to-dock height-fraction 0.5

#Dockのサイズを超えるアイコンを表示する際は，アイコンを小さくする
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false

#Dockを画面の上端に表示する
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

#ゴミ箱を非表示
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

#HOMEディレクトリを非表示
gsettings set org.gnome.shell.extensions.desktop-icons show-home false

#ホットスポットログイン無効
sudo touch /etc/NetworkManager/conf.d/20-connectivity-fedora.conf

#リポジトリ追加
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update

#HideTopBarをインストール
sudo apt install -y gnome-shell-extension-autohidetopbar

#コーデックインストール
sudo apt-get install ubuntu-restricted-extras

#googleドライブインストール
sudo apt-get install google-drive-ocamlfuse

#Papirusアイコンをインストール
sudo apt-get install papirus-icon-theme

#googleドライブ認証
google-drive-ocamlfuse

#マウント
mkdir ~/google-drive
google-drive-ocamlfuse ~/google-drive/

#起動時に自動マウント
sudo echo '#!/bin/sh' > /etc/init.d/google-drive
sudo echo 'google-drive-ocamlfuse ~/google-drive/' >> /etc/init.d/google-drive
update-rc.d google-drive defaults

#!/usr/bin/env bash

# スクリーンショットの保存先変更
defaults write com.apple.screencapture name "YYYY-MM-DD hh.mm.ss"
mkdir -p $HOME/Pictures/ScreenShots/
defaults write com.apple.screencapture location $HOME/Pictures/ScreenShots/

# ランチパットリセット
defaults write com.apple.dock ResetLaunchPad -bool TRUE

# Dock
## 自動的に隠す
defaults write com.apple.dock autohide -bool true
## 拡大しない
defaults write com.apple.dock magnification -bool false
## 最近使ったアプリを表示しない
defaults write com.apple.dock show-recents -bool false
# 開いているアプリケーションのインジケータライトを表示する
defaults write com.apple.dock show-process-indicators -bool true

# Finder
## リストビューをデフォルトにする
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
## 不可視ファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool false
## パスを表示
defaults write com.apple.finder ShowPathbar -bool true

# QuickTime
## 起動時に前回開いたファイルを開かない
defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false

# トラックパッド
## スクロール方向をナチュラルに
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Keyboard
## 入力の先頭文字を大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Menu
## バッテリー残量のパーセント表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
## 日付と時刻のフォーマット
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

# Safari
## 検索クエリをAppleに送信しない
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
## ダウンロードしたファイルを自動で開かない
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
## 追跡を無効化
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
## DevelopメニューとWebインスペクタを有効化
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
## contextメニューを追加
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
## spellcheckingを有効化
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
## オートコレクトを無効化
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
## 不正なサイトの警告
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Other
## 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## 外観モードをダークにする
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
## ネットワークディスクおよびUSBメモリ上で.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## 設定反映
for app in \
	"Dock" \
	"Finder" \
	"Safari" \
	"SystemUIServer"; do
	killall "$app" &> /dev/null || true
done

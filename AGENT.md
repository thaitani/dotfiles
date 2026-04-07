# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## セットアップコマンド

```bash
make all        # フルセットアップ (init → link → homebrew → mac)
make init       # Xcode CLT + Homebrew + zinit インストール
make link       # 全設定ファイルのシンボリックリンク作成
make homebrew   # Brewfile からパッケージインストール
make mac        # macOS システム設定の適用
make asdf       # asdf プラグイン追加とバージョンインストール
```

初回セットアップのみ:
```bash
curl -fsSL https://raw.githubusercontent.com/thaitani/dotfiles/main/install.sh | bash
```

## アーキテクチャ

### ディレクトリ構成
- **`config/`** — すべての設定の実体。`setup_scripts/links.bash` により `~/.config/` 以下に一括シンボリックリンクされる。
- **`setup_scripts/`** — モジュール化されたセットアップスクリプト。各スクリプトは冪等に設計されている。
- **`install.sh`** — ブートストラップ。ghq 規約 (`~/ghq/github.com/thaitani/dotfiles`) にクローンして `make` を呼ぶ。

### XDG Base Directory
全設定は XDG 仕様に準拠。`$XDG_CONFIG_HOME` (= `~/.config`) が起点となる。`.zshenv` で各ツールのパスを XDG に向ける。

### Zsh 設定の読み込み順
```
.zshenv         # 環境変数・XDG・ツールパス定義
.zshrc          # パス、関数、キーバインド、starship 初期化
.extensions.zsh # プラグイン・エイリアス・補完設定
.widgets.zsh    # fzf ベースのカスタムウィジェット (Ctrl+R 履歴, Ctrl+G ghq cd)
```

### Claude Code 関連
- **`config/claude/settings.json`** — 許可コマンドと拒否パス (`.env*`, `secrets/**`) の定義
- **`config/claude/skills/`** — カスタムスキル。`gh` コマンドは `gh-op-wrapper` スキルで 1Password 経由に自動ラップされる
- **`config/ai/rules/`** — AI 向けポリシー (下記参照)

## AI ポリシー (`config/ai/rules/`)

指示の優先順位: **タスク依頼文 > プロジェクト指示 > 共通ポリシー**

### 共通ポリシー (`global-policy.md`)
- 回答言語は日本語。技術用語は英語のまま。
- 安全で最小の変更から始める。抽象的な助言より具体的な手順を優先。
- 出力形式: 結論 → 理由 → 次の行動。

### このプロジェクト固有 (`project-dotfiles.md`)
- シェル起動を壊さない。
- セットアップスクリプトの冪等性を維持する。
- `config/` の編集は追記中心。広範囲な整形変更は避ける。
- 変更時のチェック: シンボリックリンクのパス、シェル設定の構文、シークレットの混入なし。
- リスクの高い変更は先にドライラン手順を提示する。

### コーディングスタイル (`coding-style.md`)
- 変更は依頼範囲に限定し最小限に。
- コメントは「なぜ」を説明する。「何をしているか」は不要。
- コミットは1つの目的に絞る。

## コミットルール

Conventional Commits 形式 (日本語) を使う。`commitizen` (`cz-conventional-changelog-ja`) で管理。

```
<type>(<scope>): <件名>
```

主な type:
| type | 用途 |
|------|------|
| `feat` | 新機能・設定追加 |
| `fix` | バグ修正 |
| `chore` | ビルド・ツール・依存関係の更新 |
| `refactor` | 動作を変えないリファクタリング |
| `docs` | ドキュメントのみの変更 |
| `style` | フォーマット・空白など |

scope は変更対象のディレクトリ/ツール名 (例: `zsh`, `git`, `brew`, `karabiner`, `claude`)。

## `gh` コマンドの実行

`gh` を使う場合は必ず `op plugin run -- gh` 形式で実行する (`gh-op-wrapper` スキル参照)。

# Update PR Description

GitHubのPull RequestのDescriptionを、コミット履歴と変更内容から自動生成・更新します。

## 説明

このスキルは、指定されたPR番号のPull Requestを分析し、以下の処理を行います：

1. PRの基本情報（タイトル、baseブランチ、headブランチ）を取得
2. baseブランチとheadブランチの差分を分析（コミット履歴、変更ファイル）
3. 既存のテンプレート構造を維持しながら、変更内容に基づいたDescriptionを生成
4. GitHub APIでPRのDescriptionを更新

## 使用方法

```
/update-pr-description <PR番号> [--regenerate|--append]
```

### パラメータ

- `<PR番号>`: 更新対象のPR番号（必須）
- `[--regenerate|--append]`: オプション
  - `--regenerate`: 最新の変更で完全に再生成（デフォルト）
  - `--append`: 既存のDescriptionに新しい変更のみを追記
  - フラグなし: デフォルトで完全再生成

### 例

```bash
# PR #123のDescriptionを再生成（デフォルト）
/update-pr-description 123

# PR #123のDescriptionを再生成（明示的）
/update-pr-description 123 --regenerate

# PR #123のDescriptionに新しい変更を追記
/update-pr-description 123 --append
```

## 処理フロー

### 1. PR情報の取得

```bash
gh api repos/:owner/:repo/pulls/<PR番号> --jq '{title, body, headRefName, baseRefName}'
```

### 2. 変更内容の分析

baseブランチとの差分を分析：

```bash
# コミット履歴を取得
git log <base>..<head> --oneline

# 変更ファイルの統計を取得
git diff <base>...<head> --stat

# 詳細な変更サマリーを取得
git diff <base>...<head> --compact-summary
```

### 3. Description生成

- 既存のテンプレート構造を自動検出し、その構造を維持
- コミットメッセージから主な変更内容を抽出
- 変更されたファイルから影響範囲を推測
- 新規ファイル、削除ファイル、変更ファイルを分類

### 4. PRの更新

```bash
jq -Rs '{"body": .}' description.md | gh api -X PATCH repos/:owner/:repo/pulls/<PR番号> --input -
```

## 注意事項

### baseブランチの特定

- PR情報から正しいbaseブランチを取得します
- baseブランチがmain/developと異なる場合（例: feature/xxx → feature/yyy）も正しく処理します
- featureブランチ同士のPRにも対応します

### テンプレート構造の維持

既存のDescriptionにテンプレート構造が含まれている場合、そのセクション構造を可能な限り維持しながら、各セクションの内容を変更内容に基づいて更新します。

一般的なPRテンプレートのセクション（例：説明、変更内容、テスト、スクリーンショットなど）に対応しています。

### マージコミットの扱い

`git log`で`--first-parent`オプションを使用して、マージコミットを除外し、実際の変更コミットのみを分析します。

### エラーハンドリング

- PRが存在しない場合
- GitHub APIのエラー（レート制限、認証エラーなど）
- Gitコマンドのエラー（ブランチが存在しないなど）

これらのエラーが発生した場合は、適切なエラーメッセージを表示します。

## 実装例

以下は基本的な実装フローです：

1. PR情報を取得し、baseRefNameとheadRefNameを確認
2. `git log <base>..<head> --oneline --first-parent`でコミット一覧を取得
3. 各コミットメッセージを分析し、主な変更内容を箇条書きで抽出
4. `git show --stat <commit-hash>`で各コミットの変更ファイルを確認
5. テンプレートに沿ってDescriptionを構築
6. 一時ファイルに保存後、jqでJSON化してGitHub APIで更新

## 依存関係

- `gh` (GitHub CLI)
- `git`
- `jq`

## 汎用性

このスキルは任意のGitHubリポジトリで使用できます。現在のリポジトリのPRテンプレート構造を自動的に検出し、それに合わせてDescriptionを生成します。

## バージョン

- **Version**: 1.0.0
- **Created**: 2026-01-28
- **Author**: tk-zzz

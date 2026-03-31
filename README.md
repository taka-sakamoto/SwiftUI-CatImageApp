# Cat Image App 🐱

SwiftUIで開発した猫画像アプリです。  
APIから画像を取得し、お気に入り機能を実装しています。

---

## ■ アプリ概要
猫の画像を一覧表示し、気に入った画像をお気に入り登録できるシンプルなアプリです。  
SwiftUIの基本構成（MVVM・状態管理・非同期通信）を意識して実装しました。

---

## ■ 機能
- 猫画像一覧表示（API取得）
- お気に入り登録 / 削除
- お気に入り一覧表示
- Pull to Refresh対応
- 詳細画面表示

---

## ■ 使用技術
- SwiftUI
- MVVMアーキテクチャ
- async / await（非同期通信）
- UserDefaults（お気に入り保存）
- REST API（The Cat API）

---

## ■ 工夫した点
- LazyVGridを使った2カラムレイアウトの実装
- 画像サイズの違いによるレイアウト崩れを修正
- AsyncImageで発生する再描画問題を解決するため、独自のImageLoaderを実装
- お気に入りの即時反映（状態管理の最適化）
- 画面遷移時のView再利用による不具合を解消

---

## ■ 苦労した点
- 画像の縦横比によるUI崩れや重なり問題の解決
- SwiftUIのView再利用（id管理）による表示不具合の対応
- AsyncImageのキャッシュ挙動による画像未表示問題

---

## ■ 今後の改善点
- 画像キャッシュの最適化（パフォーマンス向上）
- アニメーションの追加
- CoreDataへの移行
- ダークモード対応

---

## ■ 実行方法
1. 本リポジトリをクローン
2. Xcodeでプロジェクトを開く
3. APIキーを設定（The Cat API）
4. ビルド・実行

※ APIキーは含まれていません。

---

## ■ 画面イメージ

### Cats画面
![Cats](screenshot1.png)

### Favorites画面
![Favorites](screenshot2.png)

### 詳細画面
![Detail](screenshot3.png)

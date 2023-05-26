# Active::Dbml

ActiveDBML: データベース設計と開発を橋渡しするGem

ActiveDBMLは、データベース開発を合理化するために設計された新しく、便利なRubyのGemです。その核となる機能は、ActiveRecordからデータベースマークアップ言語（DBML）を出力するRakeタスクを提供することです。このGemの主な目的は、データベースの定義と実際の開発の間のズレを解消し、開発の全ステージにおける一貫性を保証することです。

このGemを開発した目的は、DBの定義と開発の乖離を防ぐためであり、一般的な問題への堅牢な解決策を提供します。このGemを公開することで、開発者の生活を容易にするだけでなく、より広範なソフトウェア開発コミュニティに貢献できることを期待しています。

ActiveDBMLは改善のためにオープンです。私たちはプルリクエストやイシューの提出を積極的に歓迎し、奨励しています。共同の入力と努力で、このGemが進化し、より包括的で、より良いものになることを想像しています。私たちの最終目的は、皆様の貴重なフィードバックと貢献に基づいて、このGemをさらに強化することです。開発者のツールキットで欠かせないツールになるActiveDBMLの旅に、ぜひご参加ください。


## 他言語のドキュメント

- [English](/)
- [日本語](/docs/ja.md)


## 使い方

``` sh
$ rake active_dbml:export

# or (出力先を指定したい場合)
$ rake active_dbml:export["export/path.dbml"]
```

## Installation

Gemfileに下記を追加してください

```ruby
gem "active-dbml"
```

実行:

```bash
$ bundle
```

または、自身で追加することも出来ます:
```bash
$ gem install active-dbml
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

![](./docs/assets/samune.png)

# CloudFormation Linter インストール手順

> [!NOTE]
> - *CloudFormation* テンプレートの構文やプロパティを、AWS のリソース仕様に照らして検証する Linter
> - デプロイ前にテンプレートの誤りを検出するために使用 (VSCode 拡張機能と組み合わせて利用)

## 目次

- [Mac](#mac)
- [バージョンアップ](#バージョンアップ)
- [参考資料](#参考資料)

## Mac

### 1. *cfn-lint* インストール

```zsh
brew install cfn-lint
```

> [!TIP]
> - *pip* / *uv* ( `uv tool install cfn-lint` ) でもインストール可能です
> - `brew` と併用すると `cfn-lint` が 2 つになり、 PATH の順番で使われる方 (VSCode 拡張機能が使う方) が変わるため、どちらか一方にしてください

## バージョンアップ

```zsh
brew upgrade cfn-lint
```

## 参考資料

### リファレンス

- [GitHub - cfn-lint](https://github.com/aws-cloudformation/cfn-lint)

### ブログ

- [VS Code拡張機能を追加してCloudFormation開発環境をレベルアップする - DevelopersIO](https://dev.classmethod.jp/articles/20211008-vscode-extention-settings/)

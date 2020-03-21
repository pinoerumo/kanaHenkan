# kanaHenkan
かな変換アプリ用リポジトリ  


## アプリ要件
日本語のテキスト（漢字・かな混じり）を入力したら、それをルビに直したテキストを出力するアプリ  
- 例として下記のテキストをアプリに入力したら、下記の出力がアプリに表示されると想定します：  
  - 入力：`今日はいい天気です`  
  - 出力：`きょうはいいてんきです`  
  
### 画面構成
変換と表示が１画面で行われる。  
現在１画面のみとなっている  
![screen1](https://user-images.githubusercontent.com/40710040/77222267-1da6ef00-6b95-11ea-945d-4d9da58c7115.png)
  
## アピールポイント
StoryBoard使用時、困る点として多人数での開発時のマージで高確率で競合し、競合したコードが何を表しているのかわからずマージ漏れがないかの確認が難しいなどの点から保守性に富んだプロジェクトを提供できないと判断し今回StoryBoardを使用していない。  
  
横画面にも対応している  
  
UIの配置としてこちらの画像を参考にさせて頂き、各項目にアクセスしやすい用に意識した。  
![FingerRange](https://user-images.githubusercontent.com/40710040/77222035-dae41780-6b92-11ea-8a31-94ebf8072240.png)

## 未解決事象、問題点、懸念点など
・swiftならもっとスマートな書き方があるのではないか  
・Testが少ない  
・変換文字列が多くなった場合表示がおかしくなる。  
・デザインが雑魚い  
・全ての文字にルビがつく  
- 要件にはルビに直したテキストとしか書かれていなかったが、本来漢字のみにルビを振るのが好ましい。  
- つまり「田中がいる」という文章が入力された場合、「田中」のみをリクエストに投げ、  
-   
- ﾀﾅｶ  
- 田中がいる  
-   
- と出力されるのが好ましい。  
- だが、送り仮名で読みが変わる漢字などもあるのでそもそも可能なのかどうかはわからない。  
-   
- ので、今回は全ての文字に送り仮名をつける仕様としている。  

## 使用したフレームワーク
Alamofire  
PKHUD  
IQKeyboardManagerSwift  

## 開発環境
Xcode 11.3  
Swift 5.0  

//
//  CommonKey.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/20.
//  Copyright © 2020 boko. All rights reserved.
//

import Foundation
// MARK: - ルビ用定数
/**ルビ作成時の区切り文字*/
let rubyStartStr = "｜"
/**ルビ作成時の左かっこ*/
let rubyLeftBrackets = "《"
/**ルビ作成時の右かっこ*/
let rubyRightBrackets = "》"

// MARK: - API リクエスト先URL
let requestURL = "https://labs.goo.ne.jp/api/hiragana"

// MARK: - API JSON用Value
/**ひらがな変換用Param*/
let paramHiragana = "hiragana"
/**カタカナ変換用Param*/
let paramKatakana = "katakana"
/**AppidParam*/
let paramAppid = "4ad24a2713c1525039b1f9c2f5993caf1e17989e598df81a3caf80f5fab0c567"

// MARK: - API JSON用Key
/**アプリケーションID*/
let keyAppId = "app_id"
/**解析対象テキスト*/
let keySentence = "sentence"
/**出力種別：hiragana(ひらがな化)、katakana(カタカナ化)のどちらかを指定してください。*/
let keyOutputType = "output_type"

// MARK: - メッセージ定数
let messageErrorTitle = "エラー"

let messageError = "通信に失敗しました"

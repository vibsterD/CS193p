//
//  EmojiMemoryGame.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 01/07/21.
//  model-view

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // type property/var 
    static var theme = [["ðĪ§", "ð", "ð", "âšïļ","ð", "ðĪ", "ðŦ", "ð", "ð", "ð§", "ð", "ð", "ðą","ðĪŊ", "ðĻ", "ðĪ", "ðŽ", "ðĩâðŦ", "ð·", "ðĪ", "ðĪ", "ðĩ", "ðĪŦ"],
                        ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðŧ", "ð", "ð", "ð", "ðī", "ðē", "ðĩ", "ð", "ðš", "ð", "ð", "ð", "ð", "ðĄ", "ð ", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "âïļ", "ðŦ", "ð", "ðļ"],
                        ["ðģïļ", "ðī", "ðīââ ïļ", "ð", "ðĐ", "ðģïļâð","ðģïļââ§ïļ","ðšðģ","ðĶðŦ", "ðĶð―", "ðĶðą", "ðĐðŋ", "ðĶðļ", "ðĶðĐ", "ðĶðī", "ðĶðŪ", "ðĶðķ", "ðĶðŽ", "ðĶð·", "ðĶðē", "ðĶðž", "ðĶðš", "ðĶðđ", "ðĶðŋ", "ð§ðļ", "ð§ð­", "ð§ðĐ", "ð§ð§", "ð§ðū", "ð§ðŠ", "ð§ðŋ", "ð§ðŊ", "ð§ðē", "ð§ðđ", "ð§ðī", "ð§ðĶ", "ð§ðž", "ð§ð·", "ðŧðŽ", "ð§ðģ", "ð­ð°", "ðļðĻ", "ðšðļ", "ðŪðģ", "ðŪðļ", "ð­ðđ"],
                        ["â―ïļ", "ð", "ð", "âūïļ", "ðĨ", "ðū", "ð", "ð", "ðą", "ðĨ", "ðŠ", "ð", "ðļ", "ð", "ð", "ðĨ", "ð", "ðĨ", "âģïļ", "ðđ", "ðĪŋ", "ðđ", "ðĨ", "ðž", "ðīðŧââïļ", "ð§ðŋââïļ", "ð§ð―", "ðĪūðūââïļ", "âđðūââïļ", "ððžââïļ", "â·", "ðĪš"],
                        ["ðķ", "ðą", "ð­", "ðđ", "ð°", "ðĶ", "ðŧ", "ðž", "ðŧââïļ", "ðĻ", "ðĶ", "ðŊ", "ðŪ", "ð·", "ðļ", "ðĩ", "ð", "ð§", "ðĶ", "ðĶ", "ðĶ", "ðĶ", "ðĶ", "ð", "ðš", "ðĶ", "ð", "ðŠą", "ðŠ", "ðĶŽ", "ðĶ", "ðĶ", "ð", "ð", "ðĶ", "ð", "ðĶĒ", "ðĶ", "ðŋ", "ðĶŦ", "ð"],
                        ["ðĩ", "ð", "ðē", "ðģ", "ðī", "ðą", "ðŋ", "âïļ", "ð", "ð", "ðŠī", "ð", "ð", "ð", "ð", "ðū", "ð", "ð", "ð·", "ðĨ", "ðđ", "ðš", "ðļ", "ðŧ", "ðž"]
    ]
    static var themeName = ["Emojis", "Vehicles", "Flags", "Sports", "Animals", "Plants"]
    var themeInd = 0


    // type function
    static func createMemoryGame(_ themeIndex: Int) -> MemoryGame<String> {
        theme[themeIndex].shuffle()
        return MemoryGame<String>(noOfPairsOfCards: 8) { pairIndex in
        theme[themeIndex][pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(0)
            
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.Score
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()
        model.choose(card)
    }
    
    func changeTheme(_ changeBy: Int) {
        print("hellp")
        themeInd += changeBy
        themeInd %= EmojiMemoryGame.theme.count
        if themeInd < 0 {
            themeInd += EmojiMemoryGame.theme.count
        }
        model = EmojiMemoryGame.createMemoryGame(themeInd)
    }
    
}

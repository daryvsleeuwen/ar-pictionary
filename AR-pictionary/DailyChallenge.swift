import SwiftUI

struct DailyChallenge: Identifiable {
    let id: UUID
    var title: String
    var xpReward: Int
    
    init(id: UUID = UUID(), title: String, xpReward: Int) {
        self.id = id
        self.title = title
        self.xpReward = xpReward
    }
    
}

extension DailyChallenge {
    static var data: [DailyChallenge] {
        [
            DailyChallenge(title: "Raad een tekening binnen 10 seconden", xpReward: 100),
            DailyChallenge(title: "Win een game met 8 punten", xpReward: 250),
            DailyChallenge(title: "Gebruik een hele game geen gum", xpReward: 150)
        ]
    }
}

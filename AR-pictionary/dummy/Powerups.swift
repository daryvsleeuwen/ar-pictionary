import SwiftUI

struct Powerup: Identifiable {
    let id: UUID
    var icon: String
    var cost: Int
    var name: String
    var currentAmount: Int = 0
    
    init(id: UUID = UUID(), icon: String, cost: Int, name: String) {
        self.id = id
        self.icon = icon
        self.cost = cost
        self.name = name
    }
    
}

extension Powerup {
    static var dummyData: [Powerup] {
        [
            Powerup(icon: "time_increase_buy", cost: 10, name: "Krijg 5 seconden extra tijd"),
            Powerup(icon: "time_decrease_buy", cost: 20, name: "5 seconden minder bij je tegenstander"),
            Powerup(icon: "letter_hint_buy", cost: 30, name: "Krijg een aantal letter hints"),
            Powerup(icon: "skip_turn_buy", cost: 50, name: "Sla een beurt over")
        ]
    }
}

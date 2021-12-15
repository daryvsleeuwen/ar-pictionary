import Foundation

class Powerup: Identifiable, ObservableObject {
    let id: UUID
    var icon: String
    var cost: Int
    var name: String
    @Published var currentAmount: Int = 0
    
    init(id: UUID = UUID(), icon: String, cost: Int, name: String, currentAmount: Int) {
        self.id = id
        self.icon = icon
        self.cost = cost
        self.name = name
        self.currentAmount = currentAmount
    }
}

let Powerups = [
    Powerup(icon: "time_increase_buy", cost: 10, name: "Krijg 5 seconden extra tijd", currentAmount: 0),
    Powerup(icon: "time_decrease_buy", cost: 20, name: "5 seconden minder bij je tegenstander", currentAmount: 0),
    Powerup(icon: "letter_hint_buy", cost: 30, name: "Krijg een aantal letter hints", currentAmount: 0),
    Powerup(icon: "skip_turn_buy", cost: 50, name: "Sla een beurt over", currentAmount: 0)
]

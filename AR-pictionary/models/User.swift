import Foundation

class User: ObservableObject {
    @Published var id: UUID
    @Published var name: String = ""
    @Published var amountOfCoins: Int = 0
    @Published var currentLevel: Int = 0
    @Published var currentXp: Int = 0
    
    init(name: String, amountOfCoins: Int, currentLevel: Int, currentXp: Int){
        self.id = UUID()
        self.name = name
        self.amountOfCoins = amountOfCoins
        self.currentLevel = currentLevel
        self.currentXp = currentXp
    }
    
    init(name: String){
        self.id = UUID()
        self.name = name
    }
}

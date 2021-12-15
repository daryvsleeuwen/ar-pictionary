import Foundation

class GameConfig: ObservableObject {
    var gameID: UUID
    var timeLimitInSeconds: Int = 15
    @Published var opponentFounded: Bool = true
    @Published var started: Bool = false
    @Published var guesses: [String] = []
    @Published var timeRemaining: Double

    init(gameID: UUID){
        self.gameID = gameID
        self.timeRemaining = Double(self.timeLimitInSeconds)
    }
}

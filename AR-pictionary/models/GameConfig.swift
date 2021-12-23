import Foundation
import SwiftUI

class GameConfig: ObservableObject {
    @Published var gameID: String
    var timeLimitInSeconds: Int = 15
    var drawColors: [Color] = [Color.black, Color.red, Color.orange, Color.green, Color.blue, Color.pink]
    @Published var started: Bool = false
    @Published var opponent: User?
    @Published var guesses: [String] = []
    @Published var timeRemaining: Double
    @Published var currentPlayerTurn: String
    @Published var userScore: Int = 0
    @Published var opponentScore: Int = 0
    @Published var guessableWord: String = ""

    init(gameID: String, currentPlayerTurn: String){
        self.gameID = gameID
        self.timeRemaining = Double(self.timeLimitInSeconds)
        self.started = true;
        self.currentPlayerTurn = currentPlayerTurn
    }
    
    init(){
        self.gameID = "test"
        self.timeRemaining = Double(self.timeLimitInSeconds)
        self.currentPlayerTurn = "test"
    }
}

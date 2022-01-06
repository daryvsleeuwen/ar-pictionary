import Foundation
import SwiftUI

class GameConfig: ObservableObject {
    @Published var gameID: String?
    var timeLimitInSeconds: Int = 15
    var drawColors: [Color] = [Color.black, Color.red, Color.orange, Color.green, Color.blue, Color.pink]
    @Published var opponent: Player?
    @Published var guesses: [String] = []
    @Published var timeRemaining: Double = 15.0
    @Published var currentPlayerTurn: String?
    @Published var userScore: Int = 0
    @Published var opponentScore: Int = 0
    @Published var guessableWord: String = ""
    @Published var started: Bool = false
    
    init(){
        self.timeRemaining = Double(self.timeLimitInSeconds)
    }
    
    func parseStarterData(data: StarterGameConfig, opp: Player){
        gameID = data.gameID
        currentPlayerTurn = data.currentPlayerTurn
        guessableWord = data.guessableWord
        opponent = opp
        started = true
    }
}

struct Player: Decodable {
    let id: String
    let name: String
}

struct StarterGameConfig: Decodable {
    let gameID: String
    let currentPlayerTurn: String
    let guessableWord: String
    let players: [Player]
}

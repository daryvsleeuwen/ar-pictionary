import Foundation
import SwiftUI

class GameConfig: ObservableObject {
    @Published var gameID: UUID?
    var timeLimitInSeconds: Int = 15
    var drawColors: [Color] = [Color.black, Color.red, Color.orange, Color.green, Color.blue, Color.pink]
    @Published var opponentFounded: Bool = true
    @Published var opponent: User?
    @Published var guesses: [String] = []
    @Published var timeRemaining: Double
    @Published var currentPlayerTurn: UUID?

    init(){
        self.timeRemaining = Double(self.timeLimitInSeconds)
    }
}

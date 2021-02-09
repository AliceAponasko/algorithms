import Foundation

let input =
"""
Player 1:
29
21
38
30
25
7
2
36
16
44
20
12
45
4
31
34
33
42
50
14
39
37
11
43
18

Player 2:
32
24
10
41
13
3
6
5
9
8
48
49
46
17
22
35
1
19
23
28
40
26
47
15
27
"""

struct Player: Equatable, Hashable {
    var cards: [Int]
}

func parsePlayers(_ input: String) -> (player1: Player, player2: Player) {
    var players = [Player]()
    var currentPlayer = Player(cards: [])

    input.components(separatedBy: "\n\n").forEach { player in
        player.dropFirst().components(separatedBy: .newlines).forEach { card in
            guard let cardValue = Int(card) else { return }
            currentPlayer.cards.append(cardValue)
        }

        players.append(currentPlayer)
        currentPlayer = Player(cards: [])
    }

    return (players.first!, players.last!)
}

func playSpaceCards(_ player1: Player, _ player2: Player) -> Int {
    var p1 = player1
    var p2 = player2

    while !p1.cards.isEmpty && !p2.cards.isEmpty {
        (p1, p2) = playOneRound(p1, p2)
    }

    return p1.cards.isEmpty ? calculateWinnningScore(p2) : calculateWinnningScore(p1)
}

func playOneRound(_ player1: Player, _ player2: Player) -> (player1: Player, player2: Player) {
    var cards1 = player1.cards
    var cards2 = player2.cards

    let card1 = cards1.removeFirst()
    let card2 = cards2.removeFirst()

    if card1 < card2 {
        cards2.append(card2)
        cards2.append(card1)
        return (Player(cards: Array(player1.cards.dropFirst())), Player(cards: cards2))
    } else {
        cards1.append(card1)
        cards1.append(card2)
        return (Player(cards: cards1), Player(cards: Array(player2.cards.dropFirst())))
    }
}

func calculateWinnningScore(_ player: Player) -> Int {
    player.cards
        .reversed()
        .enumerated()
        .map { ($0 + 1) * $1 }
        .reduce(0, +)
}

let players = parsePlayers(input)
//print(playSpaceCards(players.player1, players.player2))

struct Round: Hashable {
    var player1: Player
    var player2: Player
}

func playRecursiveCombat(_ round: Round) -> (didIWin: Bool, winner: Player) {
    var playedRounds = Set<Round>()
    var round = round

    while !round.player1.cards.isEmpty && !round.player2.cards.isEmpty {
        if playedRounds.contains(round) { return (true, round.player1) }

        playedRounds.insert(round)

        let card1 = round.player1.cards.removeFirst()
        let card2 = round.player2.cards.removeFirst()

        let didIWin: Bool
        if card1 <= round.player1.cards.count && card2 <= round.player2.cards.count  {
            let newRound = Round(
                player1: Player(cards: Array(round.player1.cards.prefix(card1))),
                player2: Player(cards: Array(round.player2.cards.prefix(card2)))
            )
            didIWin = playRecursiveCombat(newRound).didIWin
        } else {
            didIWin = card1 > card2
        }

        if didIWin {
            round.player1.cards.append(card1)
            round.player1.cards.append(card2)
        } else {
            round.player2.cards.append(card2)
            round.player2.cards.append(card1)
        }
    }

    return (
        !round.player1.cards.isEmpty,
        !round.player1.cards.isEmpty ? round.player1 : round.player2
    )
}

print(calculateWinnningScore(playRecursiveCombat(Round(player1: players.player1, player2: players.player2)).winner))

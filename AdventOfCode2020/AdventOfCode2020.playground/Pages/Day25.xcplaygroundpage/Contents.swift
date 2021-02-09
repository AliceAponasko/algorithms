protocol Encryptable {
    var publicKey: Int { get }
    var subjectNumber: Int { get }
}

extension Encryptable {
    var subjectNumber: Int { 7 }
    var divider: Int { 20_201_227 }

    var loopSize: Int {
        var loopSize = 0
        var current = 1
        while current != publicKey {
            current *= subjectNumber
            current %= divider
            loopSize += 1
        }
        return loopSize
    }

    func encryptionKey(from publicKey: Int) -> Int {
        var current = 1
        for _ in 0..<loopSize {
            current *= publicKey
            current %= divider
        }
        return current
    }
}

struct Card: Encryptable {
    let publicKey = 10_441_485
}

struct Door: Encryptable {
    let publicKey = 1_004_920
}

print(Card().encryptionKey(from: Door().publicKey))

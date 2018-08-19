import UIKit

// Goal: Sort an array from low to high.

var unsorted: [Int] {
    let count = arc4random_uniform(1_000)
    var unsorted = [Int]()

    for _ in 0..<count {
        unsorted.append(Int(arc4random_uniform(1_000)))
    }

    return unsorted
}

// Insertion Sort

func instertionSort(for unsorted: [Int]) -> [Int] {
    var sorted = unsorted

    for i in 1..<unsorted.count {
        var position = i
        let element = sorted[position]

        while position > 0 && element < sorted[position - 1] {
            sorted[position] = sorted[position - 1]
            position -= 1
        }
        sorted[position] = element
    }

    return sorted
}

instertionSort(for: unsorted)

// Merge Sort

func mergeSort(for unsorted: [Int]) -> [Int] {
    if unsorted.count <= 1 {
        return unsorted
    }

    let middle = Int(unsorted.count / 2)
    let left = Array(unsorted[0..<middle])
    let right = Array(unsorted[middle..<unsorted.count])
    let ms1 = mergeSort(for: left)
    let ms2 = mergeSort(for: right)

    return join(left: ms1, right: ms2)
}

private func join(left: [Int], right: [Int]) -> [Int] {
    var sorted = [Int]()

    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            sorted.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            sorted.append(right[rightIndex])
            rightIndex += 1
        } else if left[leftIndex] == right[rightIndex] {
            sorted.append(left[leftIndex])
            leftIndex += 1
            sorted.append(right[rightIndex])
            rightIndex += 1
        }
    }

    while leftIndex < left.count {
        sorted.append(left[leftIndex])
        leftIndex += 1
    }

    while rightIndex < right.count {
        sorted.append(right[rightIndex])
        rightIndex += 1
    }

    return sorted
}

mergeSort(for: unsorted)

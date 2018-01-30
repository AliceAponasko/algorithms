//: Playground - noun: a place where people can play

import UIKit

struct Vertex {
    var data: String
}

extension Vertex: Hashable {
    var hashValue: Int {
        return data.hashValue
    }

    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return data.description
    }
}

enum EdgeType {
    case directed
    case undirected
}

struct Edge {
    var source: Vertex
    var destination: Vertex
    let weight: Int?
}

extension Edge: Hashable {
    var hashValue: Int {
        guard let weight = weight else {
            return "\(source)\(destination)".hashValue
        }

        return "\(source)\(destination)\(weight)".hashValue
    }

    static public func ==(lhs: Edge, rhs: Edge) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

enum Visit {
    case source
    case edge(Edge)
}

class Graph {
    var adjacencyList: [Vertex: [Edge]] = [:]

    init() {}

    func createVertex(_ data: String) -> Vertex {
        let vertex = Vertex(data: data)

        if !adjacencyList.keys.contains(vertex) {
            adjacencyList[vertex] = []
        }

        return vertex
    }

    func add(_ type: EdgeType, from source: Vertex, to destination: Vertex, weight: Int?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)

        case .undirected:
            addUndirectedEdge(from: source, to: destination, weight: weight)
        }
    }

    private func addDirectedEdge(from source: Vertex, to destination: Vertex, weight: Int?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyList[source]?.append(edge)
    }

    private func addUndirectedEdge(from source: Vertex, to destination: Vertex, weight: Int?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }

    func weight(from source: Vertex, to destination: Vertex) -> Int? {
        guard let edges = adjacencyList[source] else {
            return nil
        }

        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }

        return nil
    }

    func edges(from source: Vertex) -> [Edge]? {
        return adjacencyList[source]
    }

    func breadthFirstSearch(from source: Vertex, to destination: Vertex) -> [Edge]? {
        var queueArray = [Vertex]()
        queueArray.append(source)

        var visits: [Vertex: Visit] = [source: .source]

        while queueArray.count != 0 {
            let visitedVertex = queueArray.removeFirst()

            if visitedVertex == destination {
                var vertex = destination
                var route: [Edge] = []

                while let visit = visits[vertex],
                    case .edge(let edge) = visit {

                        route = [edge] + route
                        vertex = edge.source

                }
                return route
            }

            let neighborEdges = edges(from: visitedVertex) ?? []
            for edge in neighborEdges {
                if visits[edge.destination] == nil {
                    queueArray.append(edge.destination)
                    visits[edge.destination] = .edge(edge)
                }
            }
        }

        return nil
    }

    func depthFirstSearch(from start: Vertex, to end: Vertex) -> [Vertex] {
        var visited = Set<Vertex>()
        var potentialPath = [Vertex]()

        potentialPath.append(start)
        visited.insert(start)

        outer: while let vertex = potentialPath.last, vertex != end {
            guard let neighbors = edges(from: vertex), neighbors.count > 0 else {
                potentialPath.removeLast()
                continue
            }

            for edge in neighbors {
                if !visited.contains(edge.destination) {
                    visited.insert(edge.destination)
                    potentialPath.append(edge.destination)
                    print("appended \(edge.destination)")
                    continue outer
                }
            }

            potentialPath.removeLast()
        }

        return potentialPath
    }
}

extension Graph: CustomStringConvertible {
    public var description: String {
        var result = ""

        for (vertex, edges) in adjacencyList {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
}

let graph = Graph()

let singapore = graph.createVertex("Singapore")
let tokyo = graph.createVertex("Tokyo")
let hongKong = graph.createVertex("Hong Kong")
let detroit = graph.createVertex("Detroit")
let sanFrancisco = graph.createVertex("San Francisco")
let washingtonDC = graph.createVertex("Washington DC")
let austinTexas = graph.createVertex("Austin Texas")
let seattle = graph.createVertex("Seattle")

graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

graph.description

if let edges = graph.breadthFirstSearch(from: sanFrancisco, to: seattle) {
    for edge in edges {
        print("\(edge.source) -> \(edge.destination)")
    }
}

print(graph.depthFirstSearch(from: hongKong, to: sanFrancisco))


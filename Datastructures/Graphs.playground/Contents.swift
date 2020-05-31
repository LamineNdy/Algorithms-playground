  import Foundation
  
    //MARK: - Adjacent Matrix
  
  /// Matrix where all each edge connection is represented by 1 and 0 if not
  final class AdjacentMatrixGraph {
    private var adjacentMatrix: [[Int]]
    private var vertices: [String] = []
    
    init(nodes: [String]) {
      let mat1 = [Int](repeating: 0, count: nodes.count)
      adjacentMatrix = [[Int]](repeating: mat1, count: nodes.count)
      self.vertices = nodes
    }
    
    func addEdge(from : String, dest: String) {
      let i = vertices.firstIndex(of: from)
      let j = vertices.firstIndex(of: dest)
      adjacentMatrix[i!][j!] = 1
    }
    
    
    func getNodeNeighbour(_ node: String) -> [String] {
      let nodeIndex = vertices.firstIndex(of: node)
      var neighBoursIndexes: [Int] = []
      for val in adjacentMatrix[nodeIndex!].enumerated() {
        if val.element == 1 {
          neighBoursIndexes.append(val.offset)
        }
      }
      var neightBours: [String] = []
      for n in neighBoursIndexes {
        neightBours.append(vertices[n])
      }
      return neightBours
    }
    
    func bfs() {
      
    }
    
    func dfs(node: String, marked: inout Set<String>) {
      let foundNode = vertices.firstIndex(of: node)
      guard foundNode != nil else {
        return
      }
      print(node)
      marked.insert(node)
      
      for neighbor in getNodeNeighbour(node) {
        if(!marked.contains(neighbor)) {
          dfs(node: neighbor, marked: &marked)
        }
      }
    }
  }
  
  var graph1 = AdjacentMatrixGraph(nodes: ["0", "1", "2", "3", "4", "5"])
  graph1.addEdge(from: "0", dest: "1")
  graph1.addEdge(from: "0", dest: "4")
  graph1.addEdge(from: "0", dest: "5")
  graph1.addEdge(from: "1", dest: "3")
  graph1.addEdge(from: "1", dest: "4")
  graph1.addEdge(from: "2", dest: "1")
  graph1.addEdge(from: "3", dest: "2")
  graph1.addEdge(from: "3", dest: "4")
  graph1.getNodeNeighbour("0")
  var marked: Set<String> = []
  graph1.dfs(node: "0", marked: &marked)
  print("Done")
  
  
  //MARK: - Adjacent List
// Represne tgraph by an sequence of nodes, not can ca be a struct with a value a a sequence of neighbours
  final class Node {
    var data: String
    var neightbour: [Node]
    
    init(data: String, neightbour: [Node]) {
      self.data = data
      self.neightbour = neightbour
    }
  }
  
  final class AdjacentListGraph {
    var nodes: [Node] = []
  }

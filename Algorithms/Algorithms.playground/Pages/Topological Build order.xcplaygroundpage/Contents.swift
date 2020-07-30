//: [Previous](@previous)

import Foundation

// Build order
// Given a list of projects, with their dependencies in pair (A, B) where B depends of A
// Print a build order

// Input
// project list: a, b ,c, d , e, f
// project dep (a,d), (f,b), (b,d ), (f, a), (d, c)
// output: f, e, a, b, d, c
// where: e does not matter, a and b can be permuted


/// Simple Stack implentation using Swift Array
struct Stack<T>{
  private var items: [T] = []
  
  mutating func push(_ item: T) {
    items.append(item)
  }
  
  @discardableResult mutating func pop() -> T? {
    return items.removeFirst()
  }
  
  var empty: Bool {
    return items.isEmpty
  }
  
}

/// State to define where we are at in the DFS to avoid reference cycle
enum DFSState {
  case blank
  case partial
  case completed
}

/// Project class definition
final class Project {
  var name: String
  var dependencies: [String: Project] = [:]
  private(set) var state = DFSState.blank
  
  init(name: String) {
    self.name = name
  }
  
  func setState(_ state: DFSState) {
    self.state = state
  }
  
  func addDep(project: Project) {
    if dependencies[project.name] == nil {
      dependencies[project.name] = project
    }
  }
}

/// Tuple to define pair target
typealias DependencyPair = (dep: String, target: String)

final class Graph {
  private var projectsMap: [String: Project] = [:]
  
  init(projectList: [String], dependencies: [DependencyPair]) {
    for p in projectList {
      projectsMap[p] = Project(name: p)
    }
    
    for pair in dependencies {
      if projectsMap[pair.dep] != nil {
        projectsMap[pair.target]?.addDep(project: projectsMap[pair.dep]!)
      }
    }
  }
  
  func orderedProject() -> Stack<Project>?{
    var projectStack = Stack<Project>()
    for pair in projectsMap {
      let project = pair.value
      if project.state == .blank {
        if !(dfs(project, stack: &projectStack)) {
          return nil
        }
      }
    }
    return projectStack
  }
  
  
  /// Run Depth first search if a cyle is not detected
  private func dfs(_ project: Project, stack: inout Stack<Project>) -> Bool {
    // checking for cycle
    if (project.state == .partial) {
      return false
    }
    if (project.state == .blank) {
      project.setState(.partial)
      for dep in project.dependencies {
        if !(dfs(dep.value, stack: &stack)) {
          return false
        }
      }
      project.setState(.completed)
      stack.push(project)
    }
    return true
  }
}

let projectGraph = Graph(projectList: ["a", "b", "c", "d", "e", "f"],
                         dependencies: [
                          ("a", "d"),
                          ("f", "b"),
                          ("b", "d"),
                          ("f", "a"),
                          ("d", "c")
])

var buildOrder = projectGraph.orderedProject()

while !buildOrder!.empty {
  print(buildOrder!.pop()!.name)
}


//: [Next](@next)

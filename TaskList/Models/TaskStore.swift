import Combine

class TaskStore: ObservableObject {
  @Published var prioritizedTasks = [
    PrioritizedTasks(
      priority: .high,
      names: [
        "File Taxes.",
        "Team meeting at 2PM.",
        "Networkiing at 3PM.",
        "Do Code Reviews/Validation."
        
      ]
    ),
    PrioritizedTasks(
      priority: .medium,
      names: [
        "Do Groceries at 8PM.",
        "Walk the Dog.",
        "Finish reading Outliers."

      ]
    ),
    PrioritizedTasks(
      priority: .low,
      names: [
       "Clean Dishes."
        
      ]
    ),
    PrioritizedTasks(
      priority: .no,
      names: [
       "Go to GYM."
      ]
    )
  ]
  
  func getIndex(for priority: Task.Priority) -> Int {
    prioritizedTasks.firstIndex { $0.priority == priority }!
  }
}

private extension TaskStore.PrioritizedTasks {
  init(priority: Task.Priority, names: [String]) {
    self.init(
      priority: priority,
      tasks: names.map { Task(name: $0) }
    )
  }
}

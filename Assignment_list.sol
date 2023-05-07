pragma experimental ABIEncoderV2;
pragma solidity >=0.4.21 <0.8.0;

contract AssignmentTracker {
  uint public taskCount = 0;

  struct Task {
    uint id;
    string content;
    bool completed;
  }

  mapping(uint => Task) public tasks;

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );


  function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  }

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }
  
  function getAllTasks() public view returns (Task[] memory) {
    Task[] memory allTasks = new Task[](taskCount);
    for (uint i = 1; i <= taskCount; i++) {
      allTasks[i-1] = tasks[i];
    }
    return allTasks;
  }
}
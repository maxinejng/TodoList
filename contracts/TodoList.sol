// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {

    uint public taskCount;

    mapping(uint => task) public tasks;

    event taskAdded(uint id, string content, bool isCompleted);

    event taskCompleted(uint id, bool isCompleted);

    event taskList(uint id, string content);

    struct task {
        uint id;
        string content;
        bool isCompleted;
    }

    function addTask(string memory _newTask) public {
        taskCount += 1;
        tasks[taskCount] = task(taskCount, _newTask, false);
        emit taskAdded(taskCount, _newTask, false);
    } 

    function taskComplete(uint _id) public {
        tasks[_id].isCompleted = true;
        emit taskCompleted(_id, true);
    }

    function seeTasks() public {
        for (uint i = 0; i<=taskCount; i++) {
            if (tasks[i].isCompleted == false) {
                emit taskList(tasks[i].id, tasks[i].content);
            }
        }
    }

}

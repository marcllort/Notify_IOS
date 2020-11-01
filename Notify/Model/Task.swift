//
//  Task.swift
//  Notify
//
//  Created by Marc Llort Maulion on 27/10/2020.
//

import Foundation


class Task {
    var taskName: String
    var taskIsCompleted: Bool
    
    init(taskName: String, taskIsCompleted: Bool) {
        self.taskName = taskName
        self.taskIsCompleted = taskIsCompleted
    }
}

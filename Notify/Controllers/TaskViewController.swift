//
//  TaskViewController.swift
//  Notify
//
//  Created by Marc Llort Maulion on 27/10/2020.
//

import UIKit

class TaskViewController: UITableViewController {
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskGenerator()
        tableView.rowHeight = 85
        tableView.estimatedRowHeight = 95
        tableView.tableFooterView = UIView()
    }
    
    func taskGenerator(){
        tasks.append(Task(taskName: "prova1", taskIsCompleted: false))
        tasks.append(Task(taskName: "prova2", taskIsCompleted: false))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        cell.taskTitleLabel.text = tasks[indexPath.row].taskName
        cell.taskImageView.image = tasks[indexPath.row].taskIsCompleted ? UIImage(named: "checkbox") : UIImage(named: "empty-checkbox")
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        
        if !tasks[indexPath.row].taskIsCompleted {
            let alert = UIAlertController(title: "Marcar com a completeada", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Marcar como completa", style: .default, handler: { _ in
                self.tasks[indexPath.row].taskIsCompleted = true
                self.tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Que vols fer?", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Marcar como incompleta", style: .default, handler: { _ in
                self.tasks[indexPath.row].taskIsCompleted = false
                self.tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Eliminar", style: .cancel, handler: { _ in
                self.tasks.remove(at: indexPath.row)
                self.tableView.reloadData()
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoTransition"{
            let vc = segue.destination as! AddTaskViewController
            
            vc.callbackTask = {callbackTask in
                self.tasks.append(Task(taskName: callbackTask!, taskIsCompleted: false))
                self.tableView.reloadData()
            }
        }
    }
    
}

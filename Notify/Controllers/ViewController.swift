//
//  ViewController.swift
//  Notify
//
//  Created by Marc Llort Maulion on 27/10/2020.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var createTaskButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var callbackTask: (_ task: String?) -> Void = { _ in}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addTask(_ sender: Any) {
        callbackTask(textField.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}


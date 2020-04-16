//
//  TasksViewController.swift
//  ToDoFirebase
//
//  Created by Neskin Ivan on 13.04.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import UIKit
import Firebase

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = "Begin + \(indexPath.row)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New task", message: "Add new task?", preferredStyle: .alert)
        alertController.addTextField()
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let alertController = alertController.textFields?.first, alertController.text != "" else { return }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func signOutTapped(_ sender: UIBarButtonItem) {
        do {
          try  Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
}

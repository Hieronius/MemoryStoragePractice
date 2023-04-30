//
//  TableViewController.swift
//  MemoryStoragePractice
//
//  Created by Арсентий Халимовский on 29.04.2023.
//

import UIKit

final class TableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MemoryManager.shared.storage.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        cell.cellTitle.text = MemoryManager.shared.storage[indexPath.row].name
        cell.cellDetail.text = MemoryManager.shared.storage[indexPath.row].email
        
        return cell
    }
    
}

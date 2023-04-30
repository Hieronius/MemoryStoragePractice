//
//  ViewController.swift
//  MemoryStoragePractice
//
//  Created by Арсентий Халимовский on 29.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getUsers()
        
        
    }

    // MARK: - IBActions
    
    @IBAction func createButtonAction(_ sender: UIButton) {
        let userData = UserData(name: nameTextField.text,
                                email: emailTextField.text,
                                password: passwordTextField.text)
        MemoryManager.shared.storage.append(userData)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(MemoryManager.shared.storage) {
            MemoryManager.memoryStorage.set(encoded, forKey: "Memory")
        }
        
        
        // MemoryManager.memoryStorage.set(MemoryManager.shared.storage, forKey: "storage")
        print(MemoryManager.shared.storage.count)
    }
    
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        deleteUsers()
        print(MemoryManager.shared.storage.count)
    }
    
    // MARK: - Private Methods
    
    func getUsers() {
        if let savedData = MemoryManager.memoryStorage.object(forKey: "Memory") as? Data {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([UserData].self, from: savedData) {
                MemoryManager.shared.storage = decoded
            }
        }
    }
    
    func deleteUsers() {
        // get data from UserDefaults
        if let savedData = MemoryManager.memoryStorage.object(forKey: "Memory") as? Data {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([UserData].self, from: savedData) {
                let array = decoded
                MemoryManager.shared.storage = array.dropLast()
                
                // remove edited data to the UserDefault
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(MemoryManager.shared.storage) {
                    MemoryManager.memoryStorage.set(encoded, forKey: "Memory")
                }
            }
        
        }
        
        
    }
    

}


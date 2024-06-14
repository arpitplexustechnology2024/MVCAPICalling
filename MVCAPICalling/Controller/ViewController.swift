//
//  ViewController.swift
//  MVCAPICalling
//
//  Created by Arpit iOS Dev. on 13/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userData = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global(qos: .background).async {
            self.fetchUserdata()    
        }
    }
    
    func fetchUserdata() {
        APIHandler.shared.fetchUserData { [weak self] result in
            switch result {
            case .success(let userData):
                self?.userData = userData
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch comments:", error)
            }
        }
    }
}

// MARK: - TableView Dalegate & Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.postIdLbl.text = "\(userData[indexPath.row].postId)"
        cell.idLbl.text = "\(userData[indexPath.row].id)"
        cell.nameLbl.text = userData[indexPath.row].name
        cell.emailLbl.text = userData[indexPath.row].email
        cell.bodyLbl.text = userData[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

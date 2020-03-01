//
//  MainViewController.swift
//  CocoaPodsLab
//
//  Created by Cameron Rivera on 2/27/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private let mainView = MainView()
    private var randomUsers: [User] = []{
        didSet{
            DispatchQueue.main.async{
                self.mainView.tableView.reloadData()
            }
        }
    }
    
    override func loadView(){
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUp()
    }
    
    private func setUp(){
        navigationItem.title = "Random Users"
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(UserCell.self, forCellReuseIdentifier: "userCell")
        RandomUsersAPI.retrieveRandomUsers { [weak self] result in
            switch result{
            case .failure(let error):
                print("Error loading users: \(error)")
            case .success(let users):
                self?.randomUsers = users
            }
        }
    }

}

extension MainViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let xCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("Could not dequeue cell as a UserCell.")
        }
        
        xCell.configureCell(randomUsers[indexPath.row])
        return xCell
    }
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(randomUsers[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}



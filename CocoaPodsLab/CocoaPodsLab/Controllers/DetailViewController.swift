//
//  DetailViewController.swift
//  CocoaPodsLab
//
//  Created by Cameron Rivera on 2/27/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailView = DetailView()
    private let currentUser: User
    
    init(_ currentUser: User){
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) was not implemented")
    }
    
    override func loadView(){
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        detailView.backgroundColor = .systemBackground
        navigationItem.title = "\(currentUser.name.first) \(currentUser.name.last)"
        RandomUsersAPI.retrieveRandomUserPicture(currentUser.picture.large) { [weak self] result in
            switch result{
            case .failure(let error):
                print("Error loading user Image: \(error)")
            case .success(let image):
                DispatchQueue.main.async{
                    self?.detailView.imageView.image = image
                }
            }
        }
        detailView.phoneNumberLabel.text = "Phone Number: \(currentUser.phone)"
        detailView.dobLabel.text = "Date of Birth: \(currentUser.dob.date.components(separatedBy: "T").first ?? "")"
        detailView.addressLabel.text = "\(currentUser.location.street) \(currentUser.location.city), \(currentUser.location.state), \(currentUser.location.postcode) "
    }

}

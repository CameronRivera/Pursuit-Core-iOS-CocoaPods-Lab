//
//  UserCell.swift
//  CocoaPodsLab
//
//  Created by Cameron Rivera on 2/27/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    let operationQ = OperationQueue()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func configureCell(_ person: User){
        
        let firstOperation = BlockOperation{
            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            RandomUsersAPI.retrieveRandomUserPicture(person.picture.large) { [weak self] result in
                switch result{
                case .failure(let error):
                    print("Error retrieving random user picture: \(error).")
                case .success(let image):
                    DispatchQueue.main.async{
                        self?.imageView?.image = image
                        dispatchGroup.leave()
                    }
                }
            }
            dispatchGroup.wait()
        }
        
        let secondOperation = BlockOperation{
            DispatchQueue.main.async{
                self.textLabel?.text = "\(person.name.title) \(person.name.first) \(person.name.last)"
                self.detailTextLabel?.text = person.email
            }
        }
        
        secondOperation.addDependency(firstOperation)
        operationQ.addOperation(firstOperation)
        operationQ.addOperation(secondOperation)
    }
}

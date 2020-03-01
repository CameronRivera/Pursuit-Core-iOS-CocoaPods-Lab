//
//  MainView.swift
//  CocoaPodsLab
//
//  Created by Cameron Rivera on 2/27/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    public lazy var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpTableViewConstraints()
    }
    
    private func setUpTableViewConstraints(){
        addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}

//
//  DetailView.swift
//  CocoaPodsLab
//
//  Created by Cameron Rivera on 2/27/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {

    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public lazy var phoneNumberLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    public lazy var dobLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
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
        setUpImageViewConstraints()
        setUpPhoneNumberLabelConstraints()
        setUpDOBLabelConstraints()
        setUpAddressLabelConstraints()
    }
    
    private func setUpImageViewConstraints(){
        addSubview(imageView)
        imageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
            maker.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            maker.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    private func setUpPhoneNumberLabelConstraints(){
        addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { maker in
            maker.top.equalTo(imageView.snp.bottom).offset(20)
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setUpDOBLabelConstraints(){
        addSubview(dobLabel)
        dobLabel.snp.makeConstraints { maker in
            maker.top.equalTo(phoneNumberLabel.snp.bottom).offset(20)
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setUpAddressLabelConstraints(){
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { maker in
            maker.top.equalTo(dobLabel.snp.bottom).offset(20)
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
        }
    }
}

//
//  PrimaryView.swift
//  Layouts1
//
//  Created by Yersultan Nalikhan on 28.01.2021.
//

import UIKit

class PrimaryView: UIView {
    
    lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "apple_logo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
        setSetyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setParameters(imageName: String, title: String){
        self.titleLabel.text = title
        guard let image = UIImage(named: imageName) else { return }
        self.leftImageView.image = image
    }
    
    private func setupViews() {
        [leftImageView, titleLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
    }
        
        leftImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        leftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6).isActive = true
        leftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        leftImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        

  }
    private func setSetyle(){
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        
    }
    
}

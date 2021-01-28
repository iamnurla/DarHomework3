//
//  ViewController.swift
//  Layouts1
//

import UIKit

class MainViewController: UIViewController {

    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "cancel"), for: .normal)
        return button
    }()
    
    
    lazy var IconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vk_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email или телефон"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.init(red: 220/255, green: 220/255, blue: 222/255, alpha: 1 ).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "пароль"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    

    
    
    
    
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(red: 168/255, green: 194/255, blue: 243/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    lazy var enterByAppleView: PrimaryView = {
        let view = PrimaryView()
        
        view.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(enterByAppleViewPressed))
        tapGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
    
        let iconView = UIImageView(frame:
                       CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = UIImage(named: "question_mark")
        let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        iconView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rightViewPressed))
        tapGestureRecognizer.numberOfTapsRequired = 1
        iconView.addGestureRecognizer(tapGestureRecognizer)
        
        passwordTextField.rightView = iconContainerView
        passwordTextField.rightViewMode = .always
        
    }
    
    private func setupView() {
        [cancelButton, IconImageView , loginTextField , passwordTextField , enterButton , enterByAppleView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        IconImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 120).isActive = true
//        IconImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        IconImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        IconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        IconImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: IconImageView.bottomAnchor, constant: 90).isActive = true
//        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor).isActive = true
//        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
       

        
//        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16).isActive = true
//        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
//        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        enterByAppleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
//        enterByAppleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        enterByAppleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterByAppleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterByAppleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterByAppleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        
        enterByAppleView.setParameters(imageName: "apple_logo", title: "Войти через Apple")
        
        
        
    }
    
    //MARK: -Actions-
    
    @objc func enterButtonPressed() {
        print(#function)
    }
    
    @objc func rightViewPressed() {
        print(#function)
    }
    
    @objc func enterByAppleViewPressed() {
        print(#function)
    }
    
}


//
//  ViewController.swift
//  Workshop
//
//  Created by MacBook Pro on 24/02/2018.
//  Copyright © 2018 Bea. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
	
	let plusPhotoButton: UIButton = {
		let button = UIButton(type: .system)
		
		button.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysOriginal), for: .normal)
		
		return button
	}  ()
	
	let emailTextField: UITextField = {
		let textField = UITextField()
		
		textField.placeholder = "Email"
		textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
		textField.borderStyle = .roundedRect
		textField.font = UIFont.systemFont(ofSize: 14)
		
		return textField
	}()
	
	let usernameTextField: UITextField = {
		let tf = UITextField()
		
		tf.placeholder = "Username"
		tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
		tf.borderStyle = .roundedRect
		tf.font = UIFont.systemFont(ofSize: 14)
		
		return tf
	}()
	let passwordTextField: UITextField = {
		let tf = UITextField()
		
		tf.placeholder = "Password"
		tf.isSecureTextEntry = true
		tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
		tf.borderStyle = .roundedRect
		tf.font = UIFont.systemFont(ofSize: 14)
		
		return tf
	}()
	
	let signUpButton: UIButton = {
		let button = UIButton(type: .system)
		
		button.setTitle("Sign Up", for: .normal)
		button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
		button.layer.cornerRadius = 5
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
		
		return button
		
	}()
	
	@objc func handleSignUp (){
		let email = "dummy0@gmail.com"
		let password = "123123"
		
		Auth.auth().createUser(withEmail: email, password: password, completion: { (user:User?, error: Error?) in
			
			if let err = error {
				print ("Failed to create user:", err)
				return
				
			}
			print("Successfully created user:", user?.uid ?? "")
		})
		
	}
	
	override func viewDidLoad() {
		view.backgroundColor = .white
		super.viewDidLoad()
		
		view.addSubview(plusPhotoButton)
		
		setupInputFields ()
		setupView()
	}
	
	private func setupView() {
		plusPhotoButton.anchor(top: view.topAnchor,
													 left: nil,
													 bottom: nil,
													 right: nil,
													 paddingTop: 40,
													 paddingLeft: 0,
													 paddingBottom: 0,
													 paddingRight: 0,
													 width: 140,
													 height: 140)
		
		plusPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
	}
	
	private func setupInputFields() {
		let redView = UIView ()
		redView.backgroundColor = .red
		
		let stackView = UIStackView(arrangedSubviews:[emailTextField,
																									usernameTextField,
																									passwordTextField,
																									signUpButton])
		stackView.distribution = .fillEqually
		stackView.axis = .vertical
		stackView.spacing = 10
		
		view.addSubview(stackView)
		
		stackView.anchor(top: plusPhotoButton.bottomAnchor,
										 left: view.leftAnchor,
										 bottom: nil,
										 right: view.rightAnchor,
										 paddingTop: 20,
										 paddingLeft: 40,
										 paddingBottom: 0,
										 paddingRight: 40,
										 width: 0,
										 height: 200)
	}
	
}







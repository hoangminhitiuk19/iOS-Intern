//
//  ViewController.swift
//  Login Interface 3.0
//
//  Created by Dung on 7/18/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var rememberPassword: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    
    var eyeClick = false
    let eyeImage = UIImageView()
    var boxActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set default image for Check Box
        checkBox.setBackgroundImage(UIImage.init(named: "tick"), for: .normal)
        
        
        // CREATE An EYE CHECK IMAGE
        eyeImage.image = UIImage(named: "close-Eye")
        
        let contentEyeView = UIView()
        contentEyeView.addSubview(eyeImage)
        contentEyeView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "close-Eye")!.size.width, height: UIImage(named: "close-Eye")!.size.height)
        eyeImage.frame = CGRect(x: -10, y: 0, width: UIImage(named: "close-Eye")!.size.width, height: UIImage(named: "close-Eye")!.size.height)
        
        passwordField.rightView = contentEyeView
        passwordField.rightViewMode = .always
        
        let tapEyeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(eyeTapped(tapEyeGestureRecognizer:)))
        eyeImage.isUserInteractionEnabled = true
        eyeImage.addGestureRecognizer(tapEyeGestureRecognizer)
    }

    //Eye Box pressed
    @objc func eyeTapped(tapEyeGestureRecognizer:UITapGestureRecognizer){
        let tappedEye = tapEyeGestureRecognizer.view as! UIImageView
        if eyeClick {
            eyeClick = false
            tappedEye.image = UIImage(named: "open-Eye")
            passwordField.isSecureTextEntry = false
        } else {
            eyeClick = true
            tappedEye.image = UIImage(named: "close-Eye")
            passwordField.isSecureTextEntry = true
        }
    }
    
    //Check box pressed
    @IBAction func buttonPressed() {
           if boxActive {
                checkBox.setBackgroundImage(UIImage.init(named: "tick"), for: .normal)
            } else {
                checkBox.setBackgroundImage(UIImage.init(named: "tick-box"), for: .normal)
            }
            boxActive = !boxActive
         }
    
    //Login Pressed
    @IBAction func loginPressed(){
        if loginButton.isTouchInside {
            if emailField.text == "123" && passwordField.text == "123" {
                loginSuccess()
            }else if emailField.text == "" {
                let alert = UIAlertController(title: "Error", message: "You did not input your email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
                present(alert,animated: true)
            }else if passwordField.text == "" {
                let alert = UIAlertController(title: "Error", message: "You did not input your password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
                present(alert,animated: true)
            }else{
                let alert = UIAlertController(title: "Error", message: "Email or password is not correct", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
                present(alert,animated: true)
            }
        }
    }
    
    // Login success and go to Menu Screen
    @objc func loginSuccess(){
        let vc = storyboard?.instantiateViewController(identifier: "menu") as! MenuViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
}


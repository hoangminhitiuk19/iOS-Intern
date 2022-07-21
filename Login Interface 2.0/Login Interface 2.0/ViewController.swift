//
//  ViewController.swift
//  Login Interface 2.0
//
//  Created by Dung on 7/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonRemember: UIButton!
    
    var buttonActive = false
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonRemember.setBackgroundImage(UIImage.init(named: "tick"), for: .normal)
    }
    @IBAction func buttonPressed() {
           if buttonActive {
                buttonRemember.setBackgroundImage(UIImage.init(named: "tick"), for: .normal)
            } else {
                buttonRemember.setBackgroundImage(UIImage.init(named: "tick-box"), for: .normal)
            }
            buttonActive = !buttonActive
         }
    
    @IBAction func loginPressed(){
        if loginButton.isTouchInside {
            if email.text == "123" && password.text == "123" {
                
            }else if email.text == "" {
                let alert = UIAlertController(title: "Error", message: "You did not input your email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
                present(alert,animated: true)
            }else if password.text == "" {
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
    @IBAction func startGame(){
        let vc = storyboard?.instantiateViewController(identifier: "menu") as! MenuViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
}


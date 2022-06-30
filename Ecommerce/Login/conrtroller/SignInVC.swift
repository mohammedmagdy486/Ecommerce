//
//  SignInVC.swift
//  Ecommerce
//
//  Created by AMN on 5/22/22.
//

import UIKit
import MBProgressHUD
class SignInVC: UIViewController {
    
    
    @IBOutlet weak var signInBtn: ButtonGradient!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var showPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func prepareForInterfaceBuilder() {
        setup()
    }
    func setup(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black]
        signUpBtn.addTarget(self, action: #selector(signupBtnTabbed), for: .touchUpInside)
        signInBtn.addGradientConfiguration(with: gradientButtonModel(firstColor: UIColor(named: "GradientBtnFC") , lastColor: UIColor(named: "GradientBtnLC"), firstPointX: 0, lastPointX: 1, firstPointY: 0, lastPointY: 1))
        signInBtn.addTarget(self, action: #selector(signInBtnTabbed), for: .touchUpInside)
        showPasswordBtn.setImage(UIImage(named: "Eye"), for: .normal)
        showPasswordBtn.addTarget(self, action: #selector(showPasswordBtnTapped), for: .touchUpInside)
    }
    
    @objc private func signupBtnTabbed(){
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainSB.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        vc.comingFrom = "SignInVC"
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @objc private func showPasswordBtnTapped(){
        passwordTF.isSecureTextEntry.toggle()
        showPasswordBtn.isSelected.toggle()
        showPasswordBtn.setImage(UIImage.init(systemName: "eye.slash"), for: .selected)
        showPasswordBtn.setImage(UIImage(named: "Eye"), for: .normal)
    }
    
    @objc private func signInBtnTabbed(){
        let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
        spiningActivity.label.text = "Loading"
        spiningActivity.detailsLabel.text = "Please wait"
        delay(durationInSeconds: 1.0) {
            MBProgressHUD.hide(for: self.view, animated: true)
            if (self.emailTF.text == "m@gmail.com") && (self.passwordTF.text == "12345678") {
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let myVC = storyboard.instantiateViewController(withIdentifier: "NewHomeVC") as! HomeVC
                self.navigationController?.pushViewController(myVC, animated: true)
                UserDefaults.standard.set("m", forKey: Constants.shared.token)
                let getInValue = true
            }
            
            else {
                
                let alertContoller = UIAlertController (title: "Alert" , message: "Your e-mail or password isn't correct" , preferredStyle: .alert)
                alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                self.present(alertContoller , animated: true, completion: nil)
            }
        }
        
    }
}
 

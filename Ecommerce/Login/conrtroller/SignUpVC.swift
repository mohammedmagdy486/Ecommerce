//
//  SignUpVC.swift
//  Ecommerce
//
//  Created by AMN on 5/22/22.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var signUpBtn: ButtonGradient!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var showPasswordBTn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    var comingFrom: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        signInBtn.addTarget(self, action: #selector(signInBtnTabbed), for: .touchUpInside)
        signUpBtn.addGradientConfiguration(with: gradientButtonModel(firstColor: UIColor(named: "GradientBtnFC") , lastColor: UIColor(named: "GradientBtnLC"), firstPointX: 0, lastPointX: 1, firstPointY: 0, lastPointY: 1))
        showPasswordBTn.setImage(UIImage(named: "Eye"), for: .normal)
        showPasswordBTn.addTarget(self, action: #selector(showPasswordBTnTapped), for: .touchUpInside)
    }
    
    @objc func showPasswordBTnTapped(){
        passwordTF.isSecureTextEntry.toggle()
        showPasswordBTn.isSelected.toggle()
        showPasswordBTn.setImage(UIImage.init(systemName: "eye.slash"), for: .selected)
        showPasswordBTn.setImage(UIImage(named: "Eye"), for: .normal)
    }
    
    @objc private func backBtnTabbed (){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func signInBtnTabbed(){
        if comingFrom == "SignInVC"{
            dismiss(animated: true, completion: nil)}
        else {
            let mainSB = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainSB.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

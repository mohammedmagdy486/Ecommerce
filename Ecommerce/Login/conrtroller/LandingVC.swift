//
//  LandingVC.swift
//  Ecommerce
//
//  Created by AMN on 5/22/22.
//
import Foundation
import UIKit

class LandingVC: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signInTabedBtn: ButtonGradient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        let backBtnImage = UIImage(named: "Shape")
        self.navigationController?.navigationBar.backIndicatorImage = backBtnImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtnImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let noBackBtn = UIBarButtonItem(image: UIImage(named: "noImage"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(noBackBtnTapped))
        navigationItem.leftBarButtonItem = noBackBtn
        signInTabedBtn.addGradientConfiguration(with: gradientButtonModel(firstColor: APPColor.gradientFirstColor.uiColor, lastColor: UIColor(named: "GradientBtnLC"), firstPointX: 0, lastPointX: 1, firstPointY: 0, lastPointY: 1))
        signInTabedBtn.addTarget(self, action: #selector(signInTabed), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
    }
    
    @objc func noBackBtnTapped (){
        
    }
    
    @objc func signInTabed(){
        performSegue(withIdentifier: "SignInSegue", sender: nil )
    }
    
    @objc func signUpBtnTapped(){
        performSegue(withIdentifier: "SignUpSegue", sender: nil)
    }
    
}

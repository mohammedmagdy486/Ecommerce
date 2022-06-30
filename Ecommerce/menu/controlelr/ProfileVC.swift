//
//  Profile.swift
//  Ecommerce
//
//  Created by AMN on 6/10/22.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var adressLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        let backBtnImage = UIImage(named: "Shape")
        self.navigationController?.navigationBar.backIndicatorImage = backBtnImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtnImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        editBtn.addTarget(self, action: #selector(editBtnTapped), for: .touchUpInside)
    }
    
    @objc func editBtnTapped (){
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        vc.editUserProfileDelegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension ProfileVC: editUserProfileDelegate{
    func saveProfileData(name: String, address: String, city: String, gender: String, email: String, phoneNumber: String) {
        nameLbl.text = name
        adressLbl.text = address
        cityLbl.text = city
        emailLbl.text = email
        genderLbl.text = gender
        phoneNumberLbl.text = phoneNumber
    }
}

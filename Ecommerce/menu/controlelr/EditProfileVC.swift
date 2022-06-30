//
//  EditProfileVC.swift
//  Ecommerce
//
//  Created by AMN on 6/10/22.
//

import UIKit
protocol editUserProfileDelegate:  AnyObject{
    func saveProfileData (name: String, address: String, city: String, gender: String, email: String, phoneNumber: String)
}

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var adressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
     // MARK: - Props
    weak var editUserProfileDelegate : editUserProfileDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - functions
    // UI
    func setup(){
        saveBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    @objc func backBtnTapped (){
       dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @objc func saveBtnTapped (){
        editUserProfileDelegate?.saveProfileData(name: nameTF.text ?? "", address: adressTF.text ?? "", city: cityTF.text ?? "", gender: genderTF.text ?? "", email: emailTF.text ?? "", phoneNumber: phoneTF.text ?? "")
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

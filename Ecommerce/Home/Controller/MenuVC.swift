//
//  MenuVC.swift
//  Ecommerce
//
//  Created by AMN on 6/4/22.
//

import UIKit
import MBProgressHUD

class MenuVC: UIViewController {
    
    @IBOutlet weak var menuTV: UITableView!
    @IBOutlet weak var signOutBtn: CorneredButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        menuTV.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        signOutBtn.addTarget(self, action: #selector(signOutBtnTapped), for: .touchUpInside)
    }
    
    @objc func signOutBtnTapped(){
        
        let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
        spiningActivity.label.text = "Loading"
        spiningActivity.detailsLabel.text = "Please wait"
        delay(durationInSeconds: 1.0) {
            MBProgressHUD.hide(for: self.view, animated: true)
            UserDefaults.standard.set("", forKey: Constants.shared.token)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myVC = storyboard.instantiateViewController(withIdentifier: "LandingVC") as! LandingVC
            self.navigationController?.pushViewController(myVC, animated: true)
        }
    }
}

extension MenuVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.instance.getSideMenuData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell {
            let menuCell = DataServices.instance.getSideMenuData()[indexPath.row]
            cell.updateMenuCell(data: menuCell)
            return cell
        }
        else {
            return MenuCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        if (DataServices.instance.getSideMenuData()[indexPath.row].menuCellName == "Home") {
        //            dismiss(animated: true, completion: nil)
        //        }
        //        else {
        ////            let storyboard = UIStoryboard(name: "menu", bundle: nil)
        ////            let vc = storyboard.instantiateViewController(withIdentifier: "Profile")
        //        }
        let storyboard = UIStoryboard(name: "menu", bundle: nil)
        switch DataServices.instance.getSideMenuData()[indexPath.row].menuCellName {
        case "Home":
            dismiss(animated: true, completion: nil)
        case "Profile":
            let vc = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
        case "My Cart":
            let vc = storyboard.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
            self.navigationController?.pushViewController(vc, animated: true)
        case "Favorite":
            let vc = storyboard.instantiateViewController(withIdentifier: "FavoriteVC") as! FavoriteVC
            self.navigationController?.pushViewController(vc, animated: true)
        case "My Orders":
            let vc = storyboard.instantiateViewController(withIdentifier: "MyOrdersVC") as! MyOrdersVC
            self.navigationController?.pushViewController(vc, animated: true)
        case "Language":
            let vc = storyboard.instantiateViewController(withIdentifier: "LanguagesVC") as! LanguagesVC
            self.navigationController?.pushViewController(vc, animated: true)
        case "Settings":
            let vc = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            dismiss(animated: true, completion: nil)
        }
    }
    
}

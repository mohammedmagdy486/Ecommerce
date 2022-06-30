//
//  MyCart.swift
//  Ecommerce
//
//  Created by AMN on 6/10/22.
//

import UIKit
import CoreData

class MyCartVC: UIViewController {
    @IBOutlet weak var cartTV: UITableView!
    @IBOutlet weak var continueBtn: ButtonGradient!
    
    var cartData: [CartCellCD] = []
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var deleteItemTag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTV.delegate = self
        cartTV.dataSource = self
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartData = CoreDataServices.instance.fetchCartItems(completion: { complete in
            
        })
        if cartData.count == 0{
            cartTV.isHidden = true
        }
        else{
            cartTV.isHidden = false
        }
    }
    
    func setup(){
        let backBtnImage = UIImage(named: "Shape")
        self.navigationController?.navigationBar.backIndicatorImage = backBtnImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtnImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let notificationBtn = UIBarButtonItem(image: UIImage(named: "Notification"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(notificationBtnTapped))
        navigationItem.rightBarButtonItem = notificationBtn
        continueBtn.addGradientConfiguration(with: gradientButtonModel(firstColor: APPColor.gradientFirstColor.uiColor, lastColor: UIColor(named: "GradientBtnLC"), firstPointX: 0, lastPointX: 1, firstPointY: 0, lastPointY: 1))
        cartTV.register(UINib(nibName: "CartTVCell", bundle: nil), forCellReuseIdentifier: "CartTVCell")
        if cartData.count == 0{
            cartTV.isHidden = true
        }
        else{
            cartTV.isHidden = false
        }
    }
    
    @objc func notificationBtnTapped(){
        
    }
    
}

extension MyCartVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTV.dequeueReusableCell(withIdentifier: "CartTVCell") as! CartTVCell
        cell.updateCell(data: cartData[indexPath.row])
        if cell.itemColorView.backgroundColor != UIColor(named: ""){
        deleteItemTag = indexPath.row
        cell.deleteItem.addTarget(self, action: #selector(deleteItemTapped), for: .touchUpInside)
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    @objc func deleteItemTapped(){
        CoreDataServices.instance.removeItemFromCoreData(atIndexPath: deleteItemTag ?? 0, arrayOfData: cartData)
        if cartData.count == 0{
            cartTV.isHidden = true
        }
        else{
            cartTV.isHidden = false
        }
        cartTV.reloadData()
    }
    
}

//
//  CategoryVC.swift
//  Ecommerce
//
//  Created by AMN on 5/27/22.
//

import UIKit

class CategoryVC: UIViewController {
    @IBOutlet weak var categoryTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTV.delegate = self
        categoryTV.dataSource = self
        setup()
    }
    
    func setup(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let searchBtn = UIBarButtonItem(image: UIImage(named: "Search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(searchBtnTapped))
        let notificationBtn = UIBarButtonItem(image: UIImage(named: "Notification"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(notificationBtnTapped))
        navigationItem.backBarButtonItem?.tintColor = .gray
        navigationItem.rightBarButtonItems = [notificationBtn, searchBtn]
        categoryTV.register(UINib(nibName: "CategoryTVCell", bundle: nil), forCellReuseIdentifier: "CategoryTVCell")
    }
 
    @objc func searchBtnTapped(){
        
    }
    
    @objc func notificationBtnTapped(){
        
    }
}

extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.instance.getCategoryCVData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTVCell", for: indexPath) as? CategoryTVCell {
            let CategoryCell = DataServices.instance.getCategoryCVData()[indexPath.row]
            cell.updateCategoryCell(data: CategoryCell)
            cell.categoryImage.imageCornerConfiguration(with: CorneredImageViewModel(imageCornerRadius: 10, imageBorderWidth: 1))
            cell.categoryBackView.viewCornerConfiguration(with: CorneredViewViewModel(viewCornerRadius: 10, viewBorderWidth: 1))
            if cell.categoryName.text == "Women"{
                cell.categoryBackView.backgroundColor = #colorLiteral(red: 0.4, green: 0.4941176471, blue: 0.9176470588, alpha: 1)
            }
            else if cell.categoryName.text == "Men"{
                cell.categoryBackView.backgroundColor = #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 1)
            }
            else {
                cell.categoryBackView.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.9137254902, blue: 0.4823529412, alpha: 1)
            }
            return cell
        }
        
        else{
            return CategoryTVCell()
        }
    }
    
    
}

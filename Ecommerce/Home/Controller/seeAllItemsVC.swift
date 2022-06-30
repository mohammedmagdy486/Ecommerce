//
//  FeaturedVC.swift
//  Ecommerce
//
//  Created by AMN on 5/27/22.
//

import UIKit
import CoreData

class seeAllItemsVC: UIViewController {
    
    
    @IBOutlet weak var vcName: UILabel!
    @IBOutlet weak var featuredCV: UICollectionView!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var sectionName: String?
    var items: [ItemModel]?
    var featuredItem : ItemModel?
    var featuredItemsCD: [FeaturedItemCD] = []
    var bestItemsCD:[BestItemCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featuredCV.delegate = self
        featuredCV.dataSource = self
        setup()
    }
    
    func setup() {
        let searchBtn = UIBarButtonItem(image: UIImage(named: "Search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(searchBtnTapped))
        let notificationBtn = UIBarButtonItem(image: UIImage(named: "Notification"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(notificationBtnTapped))
        navigationItem.rightBarButtonItems = [notificationBtn, searchBtn]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        featuredCV.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        if sectionName == "Featured" {
            vcName.text = "Featured"
        }
        else{
            vcName.text = "Best All"
        }
//        if featuredItemsCD.count != DataServices.instance.getFeaturedItemData().count{
    }
    override func viewWillAppear(_ animated: Bool) {
        
        for (index, _) in featuredItemsCD.enumerated() {
            CoreDataServices.instance.removeItemFromCoreData(atIndexPath: index, arrayOfData: featuredItemsCD)
        }
        for (index,_) in DataServices.instance.getFeaturedItemData().enumerated(){
            let data = DataServices.instance.getFeaturedItemData()
            featuredItem = ItemModel(itemName: data[index].itemName, itemImage: data[index].itemImage, itemPrice: data[index].itemPrice, itemDescription: data[index].itemDescription)
            CoreDataServices.instance.saveItemToFeaturedCD(item: featuredItem ?? ItemModel(itemName: "", itemImage: "", itemPrice: 0, itemDescription: "")) { finished in
            }
        }
        featuredItemsCD = CoreDataServices.instance.fetchFeaturedItem(completion: { complete in
        })
    }
    
        
    @objc func searchBtnTapped(){
        
    }
    
    @objc func notificationBtnTapped(){
        
    }
}


extension seeAllItemsVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        if  sectionName == "Featured" {
        return DataServices.instance.getFeaturedItemData().count
        }
        else {
            return DataServices.instance.getBestItemData().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCell {
            if  sectionName == "Featured"{
                items = DataServices.instance.getFeaturedItemData()
             let itemCell = featuredItemsCD[indexPath.row]
                cell.updateFeaturedItemWithCD(data: itemCell)
                return cell
            }
            else{
                items = DataServices.instance.getBestItemData()
                let itemCell = DataServices.instance.getBestItemData()[indexPath.row]
                cell.updateItemCell(data: itemCell)
                return cell
            }
        }
        else{
            return ItemCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.itemDetails = items?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


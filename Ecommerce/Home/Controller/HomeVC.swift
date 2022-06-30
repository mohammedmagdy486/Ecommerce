//
//  NewHomeVC.swift
//  Ecommerce
//
//  Created by AMN on 6/13/22.
//
import SideMenu
import UIKit
import CoreData

protocol CollectionViewCellDelegate: AnyObject {
    func userDidTap()
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var mainTV: UITableView!
    
    var menu : SideMenuNavigationController?
    var featuredItemName: String?
    var featuredItemImage: String?
    var featuredItemPrice: Float?
    var featuredItemsCD: [FeaturedItemCD] = []
    var bestItemName: String?
    var bestItemImage: String?
    var bestItemPrice: Float?
    var bestItemsCD:[BestItemCD] = []
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTV.delegate = self
        mainTV.dataSource = self
        // Do any additional setup after loading the view.
        setupMenu()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func setupMenu(){
        let mainSB = UIStoryboard(name: "Home", bundle: nil)
        menu = mainSB.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
        menu?.leftSide = true
    }
    
    func setup(){
        mainTV.register(UINib(nibName: "homeSection0TVCell", bundle: nil), forCellReuseIdentifier: "homeSection0TVCell")
        mainTV.register(UINib(nibName: "homeSection1TVCell", bundle: nil), forCellReuseIdentifier: "homeSection1TVCell")
        mainTV.register(UINib(nibName: "homeSection2TVCell", bundle: nil), forCellReuseIdentifier: "homeSection2TVCell")
        mainTV.register(HomeTableHeader.self, forHeaderFooterViewReuseIdentifier: "HomeTableHeader")
        
        let searchBtn = UIBarButtonItem(image: UIImage(named: "Search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(searchBtnTapped))
        let notificationBtn = UIBarButtonItem(image: UIImage(named: "Notification"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(notificationBtnTapped))
        let menuBtn = UIBarButtonItem(image: UIImage(named: "MenuBar"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(menuBtnTapped))
        navigationItem.rightBarButtonItems = [notificationBtn, searchBtn]
        navigationItem.leftBarButtonItem = menuBtn
        let backBtnImage = UIImage(named: "Shape")
        self.navigationController?.navigationBar.backIndicatorImage = backBtnImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtnImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        for (index, _) in featuredItemsCD.enumerated() {
            removeFeaturedItemsCD(atIndexPath: index)
        }
        for (index,_) in DataServices.instance.getFeaturedItemData().enumerated(){
            let data = DataServices.instance.getFeaturedItemData()
            featuredItemName = data[index].itemName
            featuredItemImage = data[index].itemImage
            featuredItemPrice = data[index].itemPrice
            save { finished in
            }
        }
        fetch { complete in
        }
        
        for (index, _) in bestItemsCD.enumerated() {
            removeBestItemsCD(atIndexPath: index)
        }
        for (index,_) in DataServices.instance.getBestItemData().enumerated(){
            let data = DataServices.instance.getBestItemData()
            bestItemName = data[index].itemName
            bestItemImage = data[index].itemImage
            bestItemPrice = data[index].itemPrice
            save { finished in
            }
        }
        fetch { complete in
        }
    }
    
    @objc func searchBtnTapped(){
        
    }
    
    @objc func notificationBtnTapped(){
        
    }
    
    @objc func menuBtnTapped(){
        present(menu!, animated:true)
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "homeSection0TVCell", for: indexPath) as? homeSection0TVCell {
                return cell
            }
            else{
                return UITableViewCell()
            }
            
        case 1,2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "homeSection1TVCell", for: indexPath) as? homeSection1TVCell {
                cell.section = indexPath.section
                cell.delegate = self
                cell.featuredItemsCD = featuredItemsCD
                cell.bestItemsCD = bestItemsCD
                print("best\(bestItemsCD)")
                print("featured\(featuredItemsCD)")
                return cell
            } else{
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableHeader") as? HomeTableHeader{
            switch section {
            case 0:
                header.sectionTitle.text = "Category"
                header.seeAllBtn.addTarget(self, action: #selector(categorySeeAllBtnTapped), for: .touchUpInside)
                return header
            case 1:
                header.sectionTitle.text = "Featured"
                header.seeAllBtn.addTarget(self, action: #selector(featuredSeeAllBtnTapped), for: .touchUpInside)
                return header
            case 2:
                header.sectionTitle.text = "Best All"
                header.seeAllBtn.addTarget(self, action: #selector(bestSeeAllBtnTapped), for: .touchUpInside)
                return header
            default:
                
                return header
            }
        }
        else{
            return UITableViewHeaderFooterView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    @objc func categorySeeAllBtnTapped(){
        
        performSegue(withIdentifier: "showCategoryVCSegue", sender: nil)
        
    }
    
    @objc func featuredSeeAllBtnTapped(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "seeAllItemsVC") as! seeAllItemsVC
        vc.sectionName = "Featured"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func bestSeeAllBtnTapped(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "seeAllItemsVC") as! seeAllItemsVC
        vc.sectionName = "Best"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: itemDelegate{
    func cellTapped(itemesDetails: ItemModel) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.itemDetails = itemesDetails
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func removeFeaturedItemsCD(atIndexPath indexPath: Int){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(featuredItemsCD[indexPath])
        do{
            try managedContext.save()
        }
        catch{
            debugPrint("couldn't remove\(error)")
            print("successfully removed")
        }
    }
    func removeBestItemsCD(atIndexPath indexPath: Int){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(bestItemsCD[indexPath])
        do{
            try managedContext.save()
        }
        catch{
            debugPrint("couldn't remove\(error)")
            print("successfully removed")
        }
    }
    
    func save(completion:(_ finished: Bool ) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return} // get the managed context
        let featuredData = FeaturedItemCD(context: managedContext) // instance of FeaturedItemCD Entity and Pass the context to know where to save the data
        let bestData = BestItemCD(context: managedContext)
        featuredData.itemName = featuredItemName
        featuredData.itemImage = featuredItemImage
        featuredData.itemPrice = featuredItemPrice ?? 0
        bestData.itemName = bestItemName
        bestData.itemImage = bestItemImage
        bestData.itemPrice = bestItemPrice ?? 0
        // the last few lines were for making the model
        // to pass this model to persistent store
        do {
            try managedContext.save() // because this is a throw it has to be done in do catch
            print("success")
            completion(true) // this means the save has been done correctly
        }
        catch{
            debugPrint("could not save\(error.localizedDescription)")
            completion(false) // this means the save hasn't been done correctly
        }
    }
    
    func fetch(completion:(_ complete:Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchFeaturedRequest = NSFetchRequest<FeaturedItemCD>(entityName: "FeaturedItemCD")
        let fetchBestRequest = NSFetchRequest<BestItemCD>(entityName: "BestItemCD")
        do{
            featuredItemsCD = try managedContext.fetch(fetchFeaturedRequest)
            bestItemsCD = try managedContext.fetch(fetchBestRequest)
            print("successfully fetched data")
            completion(true)
        }
        catch {
            debugPrint("couldn't fetch\(error.localizedDescription)")
            completion(false)
        }
    }
}

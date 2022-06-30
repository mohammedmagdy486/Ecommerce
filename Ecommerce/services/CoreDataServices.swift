//
//  CoreDataServices.swift
//  Ecommerce
//
//  Created by AMN on 6/26/22.
//

import CoreData
import UIKit

class CoreDataServices {
    static let instance = CoreDataServices()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func removeItemFromCoreData(atIndexPath indexPath: Int, arrayOfData: [AnyObject]){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(arrayOfData[indexPath] as! NSManagedObject)
        do{
            try managedContext.save()
        }
        catch{
            debugPrint("couldn't remove\(error)")
            print("successfully removed")
        }
    }
    func saveItemToFeaturedCD(item: ItemModel,completion:(_ finished: Bool ) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return} // get the managed context
        let featuredData = FeaturedItemCD(context: managedContext) // instance of FeaturedItemCD Entity and Pass the context to know where to save the data
        featuredData.itemName = item.itemName
        featuredData.itemImage = item.itemImage
        featuredData.itemPrice = item.itemPrice 
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
    func saveItemToCartCD(item:CartItemModel,completion:(_ finished: Bool ) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return} // get the managed context
        let cartData = CartCellCD(context: managedContext) // instance of FeaturedItemCD Entity and Pass the context to know where to save the data
        cartData.itemColor = item.itemColor
        cartData.itemImage = item.itemImage
        cartData.itemSize = item.itemSize
        cartData.itemName = item.itemName
        cartData.itemPrice = item.itemPrice
        cartData.itemPriceBeforeDiscount = item.itemPriceBeforeDiscount 
        cartData.itemDescription = item.itemDescription
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
    
    func fetchCartItems(completion:(_ complete:Bool) -> ()) ->([CartCellCD]){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return [CartCellCD]()}
        let fetchCartRequest = NSFetchRequest<CartCellCD>(entityName: "CartCellCD")
        do{
            let array = try managedContext.fetch(fetchCartRequest)
            completion(true)
         return array
        }
        catch {
            debugPrint("couldn't fetch\(error.localizedDescription)")
            completion(false)
            return [CartCellCD]()
        }
    }
    
    func fetchFeaturedItem(completion:(_ complete:Bool) -> ()) ->([FeaturedItemCD]){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return [FeaturedItemCD]()}
        let fetchRequest = NSFetchRequest<FeaturedItemCD>(entityName: "FeaturedItemCD")
        do{
            let featuredItemsCD = try managedContext.fetch(fetchRequest)
            print("successfully fetched data")
            completion(true)
            return featuredItemsCD
        }
        catch {
            debugPrint("couldn't fetch\(error.localizedDescription)")
            completion(false)
            return [FeaturedItemCD]()
        }
    }


}

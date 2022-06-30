//
//  Services.swift
//  Ecommerce
//
//  Created by AMN on 5/26/22.
//

import Foundation

class DataServices {
    static let instance = DataServices()
    var detailsCVPhotos=[
        detailsDataModel(detailsImage: "detailsPhoto", itemIndex: 0),
        detailsDataModel(detailsImage: "detailsPhoto", itemIndex: 1),
        detailsDataModel(detailsImage: "detailsPhoto", itemIndex: 2)]
    private var categoryCVData = [
        CategoryModel(categoryName: "Women", categoryImage: "WomenImage"),
        CategoryModel(categoryName: "Men", categoryImage: "MenImage"),
        CategoryModel(categoryName: "Kids", categoryImage: "KidsImage")
    ]
    
    private var featuredItemData = [
        ItemModel(itemName:  "Women T-Shirt", itemImage:  "Women T-Shirt1", itemPrice: 30, itemDescription:  " Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda"),
        ItemModel(itemName:  "Men T-Shirt", itemImage:  "Men T-Shirt1", itemPrice: 40, itemDescription:  " Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda")
    ]
    
    private var bestItemData = [
        ItemModel(itemName:  "Women T-Shirt", itemImage:  "Women T-Shirt2", itemPrice: 30,itemDescription:  " Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda"),
        ItemModel(itemName:  "Men T-Shirt", itemImage:  "Men T-Shirt2", itemPrice: 40, itemDescription:  " Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda")
    ]
    
    private var sideMenuItemData = [
        MenuCellModel(menuCellName: "Home"),
        MenuCellModel(menuCellName: "Profile"),
        MenuCellModel(menuCellName: "My Cart"),
        MenuCellModel(menuCellName: "Favorite"),
        MenuCellModel(menuCellName: "My Orders"),
        MenuCellModel(menuCellName: "Language"),
        MenuCellModel(menuCellName: "Settings")
    ]
    
    func getDetailsPhotos()->[detailsDataModel]{
        return detailsCVPhotos
    }
    func getBestItemData()->[ItemModel]{
        return bestItemData
    }
    
    func getFeaturedItemData()->[ItemModel]{
        return featuredItemData
    }
    
    func getCategoryCVData ()->[CategoryModel]{
        return categoryCVData
    }
    func getSideMenuData()->[MenuCellModel]{
        return sideMenuItemData
    }
    
}

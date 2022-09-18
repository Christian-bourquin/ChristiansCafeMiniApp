//
//  ViewController.swift
//  ChristiansCafeMiniApp
//
//  Created by CHRISTIAN BOURQUIN on 9/13/22.
//

import UIKit

class ViewController: UIViewController {
    
//background images
    
    @IBOutlet weak var cafeBackground: UIImageView!
    
    
    @IBOutlet weak var OfficeBackground: UIImageView!
    
    //dictionarys
    
    var items = ["ramen": 0.99,"bread": 2.99,"lunchmeat": 9.99,"pasta": 4.99,"cake": 29.99]
    var cart = ""
    var cartPrice = 0.0
    var passwordCheck = false
    var password = "pony"
    //list
    
    @IBOutlet weak var menuList: UILabel!

    @IBOutlet weak var cartLabel: UITextView!
    //text feild
    
    @IBOutlet weak var getRequest: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var ItemTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    //button
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    //labels
    
    @IBOutlet weak var validLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var passwordConfirmation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cafeBackground.image = UIImage(named: "menuImage")
        OfficeBackground.image = UIImage(named: "deskWithBlankScreen")
        menuList.text = ""
        print("password is pony")
        for (menuItems,menuPrice) in items{

            menuList.text = "\(menuList.text ?? "")\n\(menuItems):\(menuPrice)"

                }
    }
       
    
    @IBAction func addToCart(_ sender: Any) {
        let blah = items[getRequest.text!]
               if blah != nil{
                   validLabel.text = "Succsessful"
                   cartPrice += blah!

                   cartLabel.text! += "\n\(getRequest.text!):\(blah!)"
                   totalLabel.text = "total:\(cartPrice)"
               }

               else{
                   
                   validLabel.text = "invalid please try again"
                   

               }
    }
    
    @IBAction func EnterPasswordButton(_ sender: Any) {
        if passwordTextField.text == password{
            passwordCheck = true
            passwordConfirmation.text = "correct password"
        }
        else{
            passwordCheck = false
            passwordConfirmation.text = "inccorect password"
        }
        
        
    }
    
    @IBAction func addItemButton(_ sender: Any) {
        let check1 = ItemTextField.text
        let check2 = priceTextField.text
        if((check1) != nil && check2 != nil && passwordCheck == true){
            items[check1!] = Double(check2!)
            menuList.text = ""
            for (menuItems,menuPrice) in items{

                menuList.text = "\(menuList.text ?? "")\n\(menuItems):\(menuPrice)"

                    }
        }
        
    }
    
    @IBAction func deleteItemButton(_ sender: Any) {
        let check1 = ItemTextField.text
        if((check1) != nil && passwordCheck == true){
            items.removeValue(forKey: check1!)
            menuList.text = ""
            for (menuItems,menuPrice) in items{

                menuList.text = "\(menuList.text ?? "")\n\(menuItems):\(menuPrice)"

                    }
        
    }
    

}
    
    @IBAction func nameSort(_ sender: Any) {
        menuList.text = ""
        let sortedKeys = Array(items.keys).sorted(by:<)
        for i in 0 ..< sortedKeys.count{
            menuList.text! += "\n\(sortedKeys[i]):\(items[sortedKeys[i]]!)"

                }
            

              

    }
    
    
    @IBAction func priceSort(_ sender: Any) {
       var loop = 0
        var lastLargest = 0.0
        menuList.text = ""
        while loop<items.count{
            var menuItemsTemp = ""
            var largestPrice = 0.0
            for (menuItems,menuPrice) in items{
                if lastLargest != 0.0
                {
                    var tempPrice = menuPrice
                                    if tempPrice > largestPrice && tempPrice < lastLargest {
                                        largestPrice = tempPrice
                                        menuItemsTemp = menuItems
                                        
                                    }
                    
                }
                else{
                    
                    var tempPrice = menuPrice
                                    if tempPrice > largestPrice{
                                        largestPrice = tempPrice
                                        menuItemsTemp = menuItems
                                        
                                    }
                    
                }

                    }
            loop += 1
            menuList.text! += "\n\(menuItemsTemp):\(largestPrice)"
            lastLargest = largestPrice
        }
        
        
        
    }
    
}

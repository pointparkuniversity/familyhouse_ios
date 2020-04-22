//
//  ViewControllerSettings.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 3/22/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

class ViewControllerSettings: UIViewController {

    var OutputMsg = ""
    var swShadySide = ""
    var swNeville = ""
    var swUnivPlace = ""
    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var deviceId: UILabel!
    
    
    @IBAction func swShadySide(_ sender: UISwitch) {
        if(sender.isOn == true)
        {
            output.isHidden = false
            swShadySide = "2"
            output.text = swShadySide
            
            
        }
        else {
            output.isHidden = true
            swShadySide = ""
          
        }
    }
    
    
    @IBAction func swNeville(_ sender: UISwitch) {
        if(sender.isOn == true)
        {
            output.isHidden = false
            output.text = "1"
        }
        else {
            output.isHidden = true
        }
    }
    
    @IBAction func swUnivPlace(_ sender: UISwitch) {
        if(sender.isOn == true)
               {
                   output.isHidden = false
                   output.text = "3"
               }
               else {
                   output.isHidden = true
               }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
          let navBar = self.navigationController?.navigationBar
          navBar?.barTintColor = .familyhouseBlack
          navBar?.tintColor = UIColor.white
          navBar?.isTranslucent = false
          navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          
          //Build the contact button on the top navigation menu
          setupContactButton()
        
          //Capture the Device Id
            if let uuid = UIDevice.current.identifierForVendor?.uuidString {
                deviceId.text = uuid
                //deviceId.isHidden = true
            }
        
          //API Call to Post or Put the message for the Settings table
        
    }
    
    func setupContactButton() {
           let menuBtn = UIButton(type: .custom)
           menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
           menuBtn.setImage(UIImage(named:"contactSettings"), for: .normal)
           //--> this will be where we provide a redirect
           
           // set the menu bar
           let menuBarItem = UIBarButtonItem(customView: menuBtn)
           
           //set width
           let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
           currWidth?.isActive = true
           
           //set the height
           let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
           currHeight?.isActive = true
           
           self.navigationItem.rightBarButtonItem = menuBarItem //positions where the item will be located
       }

    //Post the Settings to the API based on the users selection on the toggle button
    func SettingsPost() {
        
    }
    
    //Get the Settings from the API for the user
    func SettingsGet() {
        
    }


}

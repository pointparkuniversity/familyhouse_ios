//
//  ViewControllerLinens.swift
//  test3
//
//  Created by Jeffrey Seaman on 3/7/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

//Declare Global Variables to collect data
var Towels = ""
var WashCloths = ""
var Bathmat = ""
var BlueBag = ""
var Sheets = ""
var SheetsTwin = ""
var SheetsQueen = ""

class ViewControllerLinens: UIViewController {

    @IBOutlet weak var HouseField: UITextField!
    @IBOutlet weak var RoomNumberField: UITextField!
    @IBOutlet weak var GuestsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = .familyhouseGreen
        navBar?.tintColor = UIColor.white
        navBar?.isTranslucent = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        //Change title
       
    }
    

   
    @IBAction func btnTowels(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            Towels = "1"
        }
    }
    
 
    
    @IBAction func checkbox_WashCloths(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            WashCloths = ""
        } else {
            sender.isSelected = true
            WashCloths = "2"
        }
    }
    
    
    @IBAction func checkbox_BathMat(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            Bathmat = ""
        } else {
            sender.isSelected = true
            Bathmat = "3"
        }
    }
    
    @IBAction func btnBlueBag(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            BlueBag = ""
        } else {
            sender.isSelected = true
            BlueBag = "4"
        }
    }
    
    
    @IBAction func btnSheets(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            Sheets = ""
        } else {
            sender.isSelected = true
            Sheets = "5"
        }
    }
    
    @IBAction func btnSheetsTwin(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            SheetsTwin = ""
        } else {
            sender.isSelected = true
            SheetsTwin = "6"
        }
    }
    
    
    @IBAction func btnSheetsQueen(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            SheetsQueen = ""
        } else {
            sender.isSelected = true
            SheetsQueen = "7"
        }
    }
    
    //Submit Button when the user selects this action event
    @IBAction func btnSubmit(_ sender: UIButton) {
        //Action Event will call Function that will call the API
        LinensPost()
    }
    
    func LinensPost() {
        let params = ["HouseName":HouseField.text!, "RoomNumber":RoomNumberField.text!, "Guests":GuestsField.text!, "LTTowels":Towels,"LTWashCloth":WashCloths, "LTBathMat":Bathmat,"LTBlueBag":BlueBag,"LTSheets":Sheets, "LTSheetsTwin":SheetsTwin,"LTSheetsQueen":SheetsQueen] as Dictionary<String, String>

               var request = URLRequest(url: URL(string: "http://familyhouse.it.pointpark.edu/api/v1/linens")!)
               request.httpMethod = "POST"
               request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")

               let session = URLSession.shared
               let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                   //(response!)
                   do {
                       let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                       //textView.text = (json)
                   } catch {
                       //textView.text = ("error")
                   }
               })

               task.resume()

           }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



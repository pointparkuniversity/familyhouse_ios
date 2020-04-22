//
//  ViewControllerFaqNeville.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 4/21/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct FaqNeville {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class FaqNevilleTableViewController: UITableViewController {
    
    var tableViewData = [FaqNeville]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [FaqNeville(opened: false, title: "Where do I park?", sectionData: ["","We strongly encourage guests to park at their designated hospital. We have reduced-rate parking vouchers for Presbyterian, Montefiore, Shadyside, Magee, Allegheny General, and West Penn hospitals. Parking is not guaranteed at the house. You can park on the street for free between 6 p.m. and 8 a.m. The rest of the day is 1-hour parking. Please make sure you do not block any driveways or loading zones. The City of Pittsburgh will tow and ticket cars. Street parking is free on Sundays. The loading zone in front of the house can be used for 15 minutes to load and unload your belongings.",""]),
                         FaqNeville(opened: false, title: "How does my key work?", sectionData: ["","The metal key will let you into your room. Your white plastic key card will allow you access to the building at any hour of the day or night. Just hold your key card over top of the tan key box on the right side of the entry. When you hear a buzz, push open the door. At night, the alarm system is set and you will have 30 seconds to access entry without tripping the alarms. For the safety of all guests and staff, please do not open the door for anyone you do not know.",""]),
                         FaqNeville(opened: false, title: "What do I do with my trash?", sectionData: ["","Please tie your trash bag and place it in the hallway outside of your door. Our housekeepers will be around each morning to collect.",""]),
                         FaqNeville(opened: false, title: "Are there any restaurants nearby? Can we have food deliveries?", sectionData: ["","We have many restaurants within walking distance, and we also have some that deliver. There is a booklet as well as many menus in our first-floor computer room. You are welcome to stop at the front desk and ask for help. If you call for a delivery, please meet the delivery driver at the front door. Our address is 514 North Neville Street. Please be sure to give your cell phone number and your room number. Please eat your meals in our dining room on the lower level.",""]),
                         FaqNeville(opened: false, title: "Is there a pharmacy nearby?", sectionData: ["","CVS is located on Centre Avenue, about 0.3 miles from Neville Family House. It is open 24 hours.",""]),
                         FaqNeville(opened: false, title: "Is there a grocery store nearby?", sectionData: ["","There are several.  Giant Eagle Market District is located on Centre Avenue, about 1.2 miles from Neville.  Whole Foods Market is located on Centre Avenue 1.5 miles from Neville. Aldi is on Baum Boulevard, about 1.2 miles from Neville, and Target is on Penn Avenue, 1.8 miles from Neville. ",""])
                         
                         
        ]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count
        } else {
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            //cell.textLabel?.numberOfLines = 0
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }

}









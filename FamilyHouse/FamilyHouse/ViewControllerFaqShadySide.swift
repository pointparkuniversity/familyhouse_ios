//
//  ViewControllerFaqShadyside.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 4/21/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct FaqShadyside {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class FaqShadysideTableViewController: UITableViewController {
    
    var tableViewData = [FaqShadyside]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [FaqShadyside(opened: false, title: "Where do I park?", sectionData: ["","We strongly encourage guests to park at their designated hospital. We have reduced-rate parking vouchers for Presbyterian, Montefiore, Shadyside, Magee, Allegheny General, and West Penn hospitals. Parking is not guaranteed at the house. You can park on the street for free between 6 p.m. and 8 a.m. The rest of the day is metered parking and costs $1.50/hr. Please make sure you do not block any driveways or loading zones. The City of Pittsburgh will tow and ticket cars. Street parking is free on Sundays. The loading zone in front of the house can be used for 15 minutes to load and unload your belongings.",""]),
                         FaqShadyside(opened: false, title: "How does my key work?", sectionData: ["","The metal key will let you into your room. Your white plastic key card will allow you access to the building at any hour of the day or night. Just hold it next to the black key box on the right side of the entry, and when you hear a click you may enter through the front or back doors. At night the alarm system is set and you will have one minute to access entry without tripping the alarms. For the safety of all guests and staff, please do not open the door for anyone you do not know.",""]),
                         FaqShadyside(opened: false, title: "What do I do with my trash?", sectionData: ["","Each floor is equipped with a trash container. It is located inside the double-door closet marked with a trash can picture in the main hallway. Please tie your trash bag and place it in the container.",""]),
                         FaqShadyside(opened: false, title: "Are there any restaurants nearby? Can we have food deliveries?", sectionData: ["","We have plenty of restaurants within walking distance, and we also have a few that deliver meals for you to enjoy in our dining room. There is a booklet in your room that covers most of the restaurants in the area and you are always welcome to stop at the front desk and ask for help. If you call for a delivery, please meet the delivery driver at the front door. Our address is 5245 Centre Avenue. Please be sure to give them your cell phone number and your room number. Please do not take meals to your guest room.",""]),
                         FaqShadyside(opened: false, title: "Is there a pharmacy nearby?", sectionData: ["","There are several pharmacies nearby. One is located in Hillman Cancer Center on Centre Avenue, about 0.2 miles from Shadyside Family House. Others are located at Giant Eagle Market District on Centre Avenue 0.3 miles from Shadyside, CVS is on Centre Avenue about 0.7 miles from Shadyside, and Rite Aid is on Baum Boulevard, about 0.4 miles from Shadyside.",""]),
                         FaqShadyside(opened: false, title: "Is there a grocery store nearby?", sectionData: ["","Giant Eagle Market District is located on Centre Avenue just 0.3 miles from Shadyside Family House.  Whole Foods Market is on Centre Avenue about 0.7 miles from Shadyside. Aldi is located 0.4 miles away on Baum Boulevard, and Target is on Penn Avenue, about 1 mile from Shadyside Family House.",""])
                         
                         
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









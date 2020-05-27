//
//  ViewControllerFaqUnivPlace.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 4/21/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct FaqUnivPlaceside {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class FaqUnivPlacesideTableViewController: UITableViewController {
    
    var tableViewData = [FaqUnivPlaceside]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [FaqUnivPlaceside(opened: false, title: "Where do I park?", sectionData: ["","We strongly encourage guests to park at their designated hospital. We have reduced-rate parking vouchers for Presbyterian, Montefiore, Shadyside, Magee, Allegheny General, and West Penn hospitals. Parking is not guaranteed at the house. You may park on the street for free between 6 p.m. and 8 a.m. The rest of the day is metered parking and costs $3/hr.   On weekends only, guests may park in the Environmental Charter School parking lot across the street from University Place. Guests are not permitted to park in the lot on weekdays.  The University Club parking lot in front of University Place is very limited. Guests may park in a metered spot (as long as there is not a yellow bag or a “no parking” sign over the meter) for free from 6 p.m.-8 a.m. Guests must move their cars by 8 a.m. Guests are not permitted to park in the non-metered spots in the middle of the lot. There are 2 handicap spots in this lot. They are first-come, first-served for anyone with a handicap license plate or placard. ",""]),
                         FaqUnivPlaceside(opened: false, title: "How does my key work?", sectionData: ["","The metal key will let you into your room. Your white plastic key card will allow you access to the building at any hour of the day or night. This key will also get you out of both stairwells. For the safety of all guests and staff, please do not open the door for anyone you do not know.",""]),
                         FaqUnivPlaceside(opened: false, title: "What do I do with my trash?", sectionData: ["","Each floor is equipped with a trash container located inside the double-door closet across from the elevator. Please tie your trash bag and place it in the container.",""]),
                         FaqUnivPlaceside(opened: false, title: "Are there any restaurants nearby? Can we have food deliveries?", sectionData: ["","We have plenty of restaurants within walking distance, and we also have a few that deliver meals for you to enjoy in our dining room. There are menus and maps in the 8th-floor lobby. You are always welcome to stop at the front desk and ask for help. If you call for a delivery, please meet the delivery driver at the front door. Our address is 116 Thackeray Avenue. Please be sure to give them your cell phone number and your room number. Please do not take meals to your guest room.",""]),
                         FaqUnivPlaceside(opened: false, title: "Is there a pharmacy nearby?", sectionData: ["","Rite Aid is located on Forbes Avenue about 0.3 miles from University Place Family House.and Rite Aid is on Baum Boulevard, about 0.4 miles from Shadyside.",""]),
                         FaqUnivPlaceside(opened: false, title: "Is there a grocery store nearby?", sectionData: ["","Giant Eagle Market District is located on Centre Avenue, about 2.2 miles from University Place Family House. Aldi is about 2.3 miles away on Baum Boulevard, Target is 2.9 miles away on Penn Avenue, and Forbes Street Market is on Forbes Avenue, 0.2 miles from University Place.",""])
                         
                         
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









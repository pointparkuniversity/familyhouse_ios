//
//  ViewControllerFaqAllHouses.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 4/21/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct FaqAllHouses {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class FaqAllHousesTableViewController: UITableViewController {
    
    var tableViewData = [FaqAllHouses]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [FaqAllHouses(opened: false, title: "What time is check-in? Checkout??", sectionData: ["","Guests must check in between 1:00 p.m. and 8:00 p.m. on their day of arrival. Checkout is by 11:00 a.m.",""]),
                         FaqAllHouses(opened: false, title: "What is your smoking policy?", sectionData: ["","Provided that your visit is medically related and the Pittsburgh-based physician in charge of your care requires that you stay, you are welcome to remain at Family House until it is safe to leave the hospital area. Family House will make every effort to accommodate extensions; however, this is on a day-by-day basis.",""]),
                         FaqAllHouses(opened: false, title: "Are laundry facilities available?", sectionData: ["","Family House does not provide medical assistance or home care services. Every patient must be accompanied by a caregiver age 18 or over throughout their entire stay at Family House.",""]),
                         FaqAllHouses(opened: false, title: "Will we have computer access?", sectionData: ["","Family House guests have access to computer labs daily between 8 a.m. and 10:00 p.m.<br /><b>Neville:</b> 1st Floor<br /><b>Shadyside:</b> 1st Floor<br /><b>University Place:</b> 8th Floor",""]),
                         FaqAllHouses(opened: false, title: "Do you have wireless internet and what is the password?", sectionData: ["","We have a free network for basic browsing and a paid network for advanced streaming. <br /> <u>Network #1: Family House Guest Wi-Fi – Basic</u><br />Password: homeaway<br />*Use this free network for basic web browsing, email, and social media.<br /><u>Network #2: Family House Guest Wi-Fi – Premium</u><br />*Use this paid network to download or stream larger files and videos.<br />*24 hours for $5; 72 hours for $12, 168 hours for $20",""]),
                         FaqAllHouses(opened: false, title: "What if I forgot my toiletries?", sectionData: ["","Family House provides soap and shampoo. We also have miscellaneous toiletries we are able to provide you free of charge. Please stop by the office if you forgot something.",""]),
                         FaqAllHouses(opened: false, title: "Am I responsible for cleaning my room?", sectionData: ["","Our housekeepers will clean your bathroom every 4 days. The night before, you will receive a reminder notice in your door along with an order form to request new linens. Please have your bathroom sink and floor clear of any personal items so our housekeepers can clean. Guests are responsible for keeping the rest of their room clean. Vacuums and cleaning supplies are available upon request at the office.",""]),
                         FaqAllHouses(opened: false, title: "What do I need to do to check out?", sectionData: ["","Checkout is by 11 a.m. Please leave your sheets, comforters, quilts, and towels in the room for our housekeepers to gather. Empty the dresser drawers and place all of your garbage in the waste baskets. In the kitchen, remove any food you may have stored in the cabinets and refrigerator/freezer. Return your CLEAN refrigerator basket to your assigned food storage cabinet. Return room keys and access cards to the office. If the office is closed, please place keys in the return key slot located next to the office.",""]),
                         FaqAllHouses(opened: false, title: "How late is the office open?", sectionData: ["","Neville, Shadyside, and University Place offices are open 7:00 a.m. to 10:00 p.m. Monday through Friday and from 8:00 a.m. to 10:00 p.m. on Saturday and Sunday.",""]),
                         FaqAllHouses(opened: false, title: "Can I bring my pet?", sectionData: ["","Out of concern for the health of our immunosuppressed guests, Family House does not allow pets in any of its facilities. If you will be accompanied by a service dog, please notify our housing office when you are making your room request.",""]),
                         FaqAllHouses(opened: false, title: "Are any meals provided?", sectionData: ["","Family House provides a complimentary Grab ‘n Go breakfast Monday through Thursday from 6:30 a.m.-8:30 a.m. Throughout the year, volunteer groups prepare and serve dinners for guests, typically once a week at each house. Additionally, there is a complimentary food pantry stocked with essentials so that guests can cook their own meals. Guests have access to the kitchen at all hours with the exception of 2 p.m.-3 p.m. daily for cleaning.",""])
                         
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








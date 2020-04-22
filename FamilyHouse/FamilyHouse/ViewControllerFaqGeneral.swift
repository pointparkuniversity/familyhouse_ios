//
//  ViewControllerFaqGeneral.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 3/24/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class TableViewController: UITableViewController {
    
    var tableViewData = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData(opened: false, title: "What is the Family House?", sectionData: ["","Family House is a 501(c)(3) nonprofit charitable organization whose mission is to provide a convenient and affordable “home away from home” for patients and their caregivers who must travel to Pittsburgh for medical treatment.",""]),
                         cellData(opened: false, title: "Where is the Family House located?", sectionData: ["","Family House has three locations in Pittsburgh’s Oakland and Shadyside neighborhoods. <b>Family House Neville</b> is located at 514 N. Neville St., Pittsburgh, PA, 15213; <b>Family House Shadyside</b> is located at 5245 Centre Ave., Pittsburgh, PA, 15232; and <b>Family House University</b> Place is located at 116 Thackeray Ave., Pittsburgh, PA, 15213.",""]),
                         cellData(opened: false, title: "How is Family House funded?", sectionData: ["","Family House is a nonprofit charitable organization governed by a community Board of Directors.  Family House’s charitable care—which is the difference between what a room actually costs the organization to operate vs. what Family House charges—amounts to more than $1.2 million annually. These funds are provided each year through generous contributions from individuals, companies, foundations, and other organizations. ",""]),
                         cellData(opened: false, title: "How can I support Family House?", sectionData: ["","Family House can be supported in a number of ways: volunteering your time as a House Volunteer or Group Volunteer, sponsoring a family for a night’s stay, underwriting a house gift, buying items from Family House’s wish list, hosting a fundraising event, or simply donating online at www.familyhouse.org",""])]
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






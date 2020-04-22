//
//  ViewControllerFaqFamilies.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 4/21/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct FaqFamilies {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class FaqFamiliesTableViewController: UITableViewController {
    
    var tableViewData = [FaqFamilies]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [FaqFamilies(opened: false, title: "Who is eligible to stay at Family House?", sectionData: ["","Patients who are seeking medical treatment at Pittsburgh area hospitals, as well as their family members and caregivers, are welcome to stay at Family House. In addition, Family House also welcomes medical professionals and health-related students.",""]),
                         FaqFamilies(opened: false, title: "How long can I stay with Family House?", sectionData: ["","Provided that your visit is medically related and the Pittsburgh-based physician in charge of your care requires that you stay, you are welcome to remain at Family House until it is safe to leave the hospital area. Family House will make every effort to accommodate extensions; however, this is on a day-by-day basis.",""]),
                         FaqFamilies(opened: false, title: "Does Family House provide medical services?", sectionData: ["","Family House does not provide medical assistance or home care services. Every patient must be accompanied by a caregiver age 18 or over throughout their entire stay at Family House.",""]),
                         FaqFamilies(opened: false, title: "Do I need a caregiver?", sectionData: ["","Yes. All patients staying at Family House must have a caregiver who is age 18 years or older. This person is solely responsible for the patient with whom they are staying, and they must stay the entire length of the patient’s visit. The caregiver must be emotionally and physically able to care for the patient and themselves and be able to assist in possible decision-making. Multiple caregivers are permitted as long as there is not a lapse in patient support.",""])]
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







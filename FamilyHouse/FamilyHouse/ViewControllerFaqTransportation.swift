//
//  ViewControllerFaqTransportation.swift
//  FamilyHouse
//
//  Created by Jeffrey Seaman on 4/21/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct FaqTrans {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class FaqTransTableViewController: UITableViewController {
    
    var tableViewData = [FaqTrans]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [FaqTrans(opened: false, title: "Is there transportation to and from the hospitals?", sectionData: ["","Courtesy shuttles provided by the UPMC Hospital System operate regularly throughout the day and evening. Guests staying with the VA Pittsburgh Healthcare System will receive a shuttle schedule from VA hospital staff. Guests staying with Allegheny General, West Penn, and Children’s hospitals will receive one round-trip Uber ride a day. Please speak with a staff member to receive your hospital’s full transportation information. ",""]),
                         FaqTrans(opened: false, title: "Where can we park?", sectionData: ["","We strongly encourage guests to park at their designated hospital. We have reduced-rate parking vouchers for Presbyterian, Montefiore, Shadyside, Magee, Allegheny General, and West Penn hospitals. Parking is not guaranteed at the houses.",""])]
                   
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








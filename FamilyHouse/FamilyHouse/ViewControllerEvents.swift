//
//  ViewControllerEvents.swift
//  test3
//
//  Created by Jeffrey Seaman on 3/15/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    var details: String = "Join us Saturday, March 7 at The Duquesne Club as Pittsburgh’s top industry and community leaders come together in support of the mission of Family House! Support our continued efforts to provide a special “home away from home” for patients and their families who are in Pittsburgh seeking medical treatment by offering convenient, affordable, temporary housing in a home-like environment. Gala After Dark ticket options start at 9 pm featuring a cocktails, live music, dancing, wine pull, exclusive raffle, and dessert! Purchase tickets to attend at familyhouse.org/gala/"
}

class ViewControllerEvents: UITableViewController {
        
    var tableViewData = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData(opened: false, title: "See Details", sectionData: ["Cell1", "Saturday, March 7", "6:30 - 10:30 PM", "The Duquesne Club", "Join us Saturday, March 7 at The Duquesne Club as Pittsburgh’s top industry and community leaders come together in support of the mission of Family House! Support our continued efforts to provide a special “home away from home” for patients and their families who are in Pittsburgh seeking medical treatment by offering convenient, affordable, temporary housing in a home-like environment. Gala After Dark ticket options start at 9 pm featuring a cocktails, live music, dancing, wine pull, exclusive raffle, and dessert! Purchase tickets to attend at familyhouse.org/gala/"])]
        // Do any additional setup after loading the view.
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
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            return cell
        }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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


//
//  ViewController.swift
//  HoExpandableTableView
//
//  Created by Eric Ho on 09/30/2018.
//  Copyright (c) 2018 Eric Ho. All rights reserved.
//

import UIKit
import HoExpandableTableView

typealias DataTuple = (title: String, items: [String])

class ViewController: UIViewController {
    @IBOutlet var expandableTableView: HoExpandableTableView!
    var itemMatrix: [DataTuple] = [(title: "abc", items: ["ab", "bc", "cd"]),
                                   (title: "123", items: ["12", "23", "34"]),
                                   (title: "ABC", items: ["AB", "BC", "CD"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register reusable identifier
        expandableTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        // assign callbacks for data source
        expandableTableView.titleForHeaderInSection = { (section) in
            return self.itemMatrix[section].title
        }
        
        expandableTableView.numberOfSectionsInTableView = {
            return self.itemMatrix.count
        }
        
        expandableTableView.numberOfRowsInSection = {(section) in
            return self.itemMatrix[section].items.count
        }
        
        expandableTableView.colorForHeaderInSection = {(section) in
            return UIColor.lightGray
        }
        
        expandableTableView.cellForRowAtIndexPath = {(indexPath) in
            let cell = self.expandableTableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
            cell.textLabel?.text = self.itemMatrix[indexPath.section].items[indexPath.row]
            return cell
        }
    }
    
}

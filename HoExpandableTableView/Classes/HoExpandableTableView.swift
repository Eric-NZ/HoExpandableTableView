//
//  HoExpandableTableView.swift
//  Pods-HoExpandableTableView_Example
//
//  Created by Eric Ho on 4/10/18.
//

import UIKit

public class HoExpandableTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        register(ExpandableTableHeader.self, forHeaderFooterViewReuseIdentifier: "ExpandableHeader")
        
        dataSource = self
        delegate = self
    }
    
    // expanded states
    private var expandedStates: [Bool] = []
    
    // Callback for Data Source & Delegate
    public var numberOfSectionsInTableView: (()->Int)?
    public var colorForHeaderInSection: ((_ section: Int)->UIColor)?
    public var titleForHeaderInSection: ((_ section: Int)->String)?
    public var heightForHeaderInSection: ((_ section: Int)->CGFloat)?
    public var numberOfRowsInSection: ((_ section: Int)->Int)?
    public var cellForRowAtIndexPath: ((_ indexPath: IndexPath)->UITableViewCell)?
    
    // MARK: - UITableView Data Source
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSections = self.numberOfSectionsInTableView?() ?? 1
        // append equivalent Bools to expandedState array
        for _ in 0..<numberOfSections {
            if expandedStates.count < numberOfSections {
                expandedStates.append(true)
            }
        }
        
        return numberOfSections
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let actualNumberOfRowsInSection = self.numberOfRowsInSection?(section) ?? 0
        // if the section is expanded, then return the actual number, or zero
        return expandedStates[section] ? actualNumberOfRowsInSection : 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cellForRowAtIndexPath?(indexPath) ?? UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ExpandableHeader") as? ExpandableTableHeader {
            header.headerColor = self.colorForHeaderInSection?(section) ?? UIColor.groupTableViewBackground
            header.section = section
            header.isExpanded = expandedStates[section]
            header.updateExpandedStateOnSection = { (section, willBecomeExpanded) in
                self.updateExpandedStateOnSection(section: section, willBecomeExpanded: willBecomeExpanded)
            }
            return header
        } else {
            return ExpandableTableHeader(reuseIdentifier: "ExpandableHeader")
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.heightForHeaderInSection?(section) ?? 36
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleForHeaderInSection?(section) ?? ""
    }
    
    // Handle expanded state changing event
    private func updateExpandedStateOnSection(section: Int, willBecomeExpanded: Bool) {
        expandedStates[section] = willBecomeExpanded
        reloadSections(IndexSet([section]), with: .automatic)
    }
}

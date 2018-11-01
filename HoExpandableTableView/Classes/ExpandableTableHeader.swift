//
//  ExpandableTableHeader.swift
//  HoExpandableTableView
//
//  Created by Eric Ho on 18/10/18.
//

import UIKit

class ExpandableTableHeader: UITableViewHeaderFooterView {
    var section: Int = 0
    var isExpanded: Bool = true {
        didSet {
            updateExpandedStateOnSection?(section, isExpanded)
            expandingIndicator.text = isExpanded ? "-" : "+"
        }
    }
    var expandingIndicator = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0)))
    var headerColor: UIColor = UIColor.black {
        didSet {
            contentView.backgroundColor = headerColor
            let complementColor = getComplementaryForColor(color: contentView.backgroundColor!)
            expandingIndicator.textColor = complementColor
            textLabel?.textColor = complementColor
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // init UI elements
        initHeaderContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public var updateExpandedStateOnSection: ((_ section: Int, _ willBecomeExpanded: Bool)->Void)?
    
    private func initHeaderContentView() {
        // create label indicates the section expanding state
        expandingIndicator.text = "-"
        expandingIndicator.font = UIFont.boldSystemFont(ofSize: 24)
        contentView.addSubview(expandingIndicator)
        
        // add constraints
        autoLayout()
        
        // add gesture recognizer
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onHeaderTapped(_:))))
    }
    
    @objc func onHeaderTapped(_ sender: UITapGestureRecognizer) {
        self.isExpanded = !isExpanded
    }
    
    private func autoLayout() {
        expandingIndicator.translatesAutoresizingMaskIntoConstraints = false
        // center Y
        NSLayoutConstraint(item: expandingIndicator, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        // right pin
        NSLayoutConstraint(item: expandingIndicator, attribute: .trailing, relatedBy: .equal, toItem: contentView.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 8).isActive = true
        // width
        NSLayoutConstraint(item: expandingIndicator, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 36).isActive = true
        // height
        NSLayoutConstraint(item: expandingIndicator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 36).isActive = true
        
    }
    // get a complementary color to this color
    private func getComplementaryForColor(color: UIColor) -> UIColor {
        
        let ciColor = CIColor(color: color)
        
        // get the current values and make the difference from white:
        let compRed: CGFloat = 1.0 - ciColor.red
        let compGreen: CGFloat = 1.0 - ciColor.green
        let compBlue: CGFloat = 1.0 - ciColor.blue
        
        return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
    }
}

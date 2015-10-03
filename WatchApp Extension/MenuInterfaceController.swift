//
//  MenuInterfaceController.swift
//  Examples
//
//  Created by Madson Cardoso on 9/27/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import WatchKit
import Foundation


class MenuInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.loadData()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBOutlet var table: WKInterfaceTable!
    var items = ["Update prices", "Update prices 2", "Force Touch", "Timer", "Counter", "Geoip"]
    
    private func loadData() {
        table.setNumberOfRows(items.count, withRowType: "CellMenu")
        
        for (index, item) in items.enumerate() {
            let row = table.rowControllerAtIndex(index) as! CellMenu
            row.textLabel.setText(item)
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let nextController = items[rowIndex]
        
        if nextController == "Update prices" {
            presentControllerWithNames(["regular", "medium", "premium"], contexts: nil)
        }
        else if nextController == "Update prices 2" {
            presentControllerWithName(nextController.lowercaseString, context: "test")
        }
        else {
            pushControllerWithName(nextController.lowercaseString, context: "test")
        }
    }
}

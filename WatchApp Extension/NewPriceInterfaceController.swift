//
//  NewPriceInterfaceController.swift
//  Examples
//
//  Created by Madson Cardoso on 10/2/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import WatchKit
import Foundation


class NewPriceInterfaceController: WKInterfaceController {
    
    @IBOutlet var pricePicker: WKInterfacePicker!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        //nf.minimumFractionDigits = 2
        
        let offSet = 100
        let maximum = 299
        let selectedItem = 199
        
        var items = Array<WKPickerItem>()
        
        for i in offSet...maximum {
            let item = WKPickerItem()
            let value = Float(i) / 100.0
            item.title = nf.stringFromNumber(value)
            item.caption = (i == selectedItem) ? "Current price" : "New price"
            items.append(item)
        }
        
        pricePicker.setItems(items)
        pricePicker.setSelectedItemIndex(selectedItem - offSet)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func doneAction() {
        dismissController()
    }
}

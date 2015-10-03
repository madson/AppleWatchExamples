//
//  UpdatePricesInterfaceController.swift
//  Examples
//
//  Created by Madson Cardoso on 10/3/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import WatchKit
import Foundation


class UpdatePricesInterfaceController: WKInterfaceController {

    @IBOutlet var picker1: WKInterfacePicker!
    @IBOutlet var picker2: WKInterfacePicker!
    @IBOutlet var picker3: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        setTitle("Done")
        
        // Configure interface objects here.
        
        let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        //nf.minimumFractionDigits = 2
        
        let offSet = 100
        let maximum = 299
        let selectedItem = 199
        
        var items1 = Array<WKPickerItem>()
        
        for i in offSet...maximum {
            let item = WKPickerItem()
            let value = Float(i) / 100.0
            item.title = nf.stringFromNumber(value)
            item.caption = "Regular"
            items1.append(item)
        }
        
        var items2 = Array<WKPickerItem>()
        
        for i in offSet...maximum {
            let item = WKPickerItem()
            let value = Float(i) / 100.0
            item.title = nf.stringFromNumber(value)
            item.caption = "Medium"
            items2.append(item)
        }

        var items3 = Array<WKPickerItem>()
        
        for i in offSet...maximum {
            let item = WKPickerItem()
            let value = Float(i) / 100.0
            item.title = nf.stringFromNumber(value)
            item.caption = "Premium"
            items3.append(item)
        }

        picker1.setItems(items1)
        picker1.setSelectedItemIndex(selectedItem - offSet)

        picker2.setItems(items2)
        picker2.setSelectedItemIndex(selectedItem - offSet + 10)
        
        picker3.setItems(items3)
        picker3.setSelectedItemIndex(selectedItem - offSet + 30)

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

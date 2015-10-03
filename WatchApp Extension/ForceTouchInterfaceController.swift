//
//  ForceTouchInterfaceController.swift
//  Examples
//
//  Created by Madson Cardoso on 10/2/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import WatchKit
import Foundation


class ForceTouchInterfaceController: WKInterfaceController {
    
    @IBOutlet var textLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func action1() {
        textLabel.setText("1st item pressed!")
    }
    
    @IBAction func action2() {
        textLabel.setText("2nd item pressed!")
    }

    @IBAction func action3() {
        textLabel.setText("3th item pressed!")
    }

    @IBAction func action4() {
        textLabel.setText("4th item pressed!")
    }

    
}

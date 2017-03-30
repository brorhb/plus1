//
//  InterfaceController.swift
//  plus1Watch Extension
//
//  Created by Bror Brurberg on 29.03.2017.
//  Copyright © 2017 Bror Brurberg. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var i:Int = 0
    
    @IBOutlet var label: WKInterfaceLabel!
    
    @IBAction func reset() {
        i = 0
        label.setText(String(i))
    }
    
    @IBAction func plusButton() {
        i += 1
        label.setText(String(i))
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
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

}

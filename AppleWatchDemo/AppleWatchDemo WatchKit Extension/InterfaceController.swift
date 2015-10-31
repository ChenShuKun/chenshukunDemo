//
//  InterfaceController.swift
//  AppleWatchDemo WatchKit Extension
//
//  Created by ChenShuKun on 15/2/11.
//  Copyright (c) 2015年 ChenShuKun. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tableView: WKInterfaceTable!
    
    let data = ["中国","北京","上海","石家庄","西藏"];
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
     
        loadData()
        // Configure interface objects here.
    }
    func loadData() {
        tableView.setNumberOfRows(data.count, withRowType: "rowID")
        
        for (index , value) in enumerate(data) {
            let cell = tableView.rowControllerAtIndex(index) as! WatchTable
            
            cell.img.setImageNamed("2")
            cell.loactionLabel.setText(value)
            
        }
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

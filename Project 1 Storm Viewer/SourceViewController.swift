//
//  SourceViewController.swift
//  Project 1 Storm Viewer
//
//  Created by Marc Aupont on 6/3/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet var tableView: NSTableView!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = FileManager()
        
        let path = Bundle.main.resourcePath!
        
        do {
            
            let items = try fileManager.contentsOfDirectory(atPath: path)
            
            for item in items {
                
                if item.hasPrefix("nssl") {
                    
                    pictures.append(item)
                }
            }
            
        } catch let err {
            
            print(err.localizedDescription)
        }
        
    }
    
    //This method is similar to number of rows method in iOS
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return pictures.count
    }
    
    //This method is similar to cellForRowAt.
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let vw = tableView.make(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil}
        
        vw.textField?.stringValue = pictures[row]
        
        return vw
        
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        guard tableView.selectedRow != -1 else { return }
        
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detailVC = splitVC.childViewControllers[1] as? DetailViewController {
            
            detailVC.imageSelected(name: pictures[tableView.selectedRow])
        }
    }
    
}

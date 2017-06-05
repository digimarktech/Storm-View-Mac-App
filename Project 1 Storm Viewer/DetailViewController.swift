//
//  DetailViewController.swift
//  Project 1 Storm Viewer
//
//  Created by Marc Aupont on 6/3/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func imageSelected(name: String) {
        
        imageView.image = NSImage(named: name)
    }
    
}

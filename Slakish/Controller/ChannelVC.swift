//
//  ChannelVC.swift
//  Slakish
//
//  Created by BootCamp on 11/5/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Cocoa

class ChannelVC: NSViewController {
    
    //Outlets
    
    @IBOutlet weak var userNameLbl: NSTextField!
    
    @IBOutlet weak var addChannelBtn: NSButton!
    
    @IBOutlet weak var tableView: NSTableView!
    
    @IBAction func addChannelClicked(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
    }
    
    override func viewDidAppear() {
        setupView()
    }
    
    
    
    func setupView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = chatPurple.cgColor
        addChannelBtn.styleButtonText(button: addChannelBtn, buttonName: "Add +", fontColor: .controlColor, alignment: .center, font: avenirRegular, size: 13.0)
    
    }
    
}

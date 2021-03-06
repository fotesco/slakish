//
//  ChatVC.swift
//  Slakish
//
//  Created by BootCamp on 11/5/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Cocoa

class ChatVC: NSViewController {

    //OUTLETS
    
    @IBOutlet weak var channelTitle: NSTextField!
    @IBOutlet weak var channelDescription: NSTextField!
    @IBOutlet weak var typingUserLbl: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var messageOutlineView: NSView!
    
    @IBOutlet weak var messageTxt: NSTextField!
    
    @IBOutlet weak var sendMessageBtn: NSButton!
    
    @IBOutlet weak var welcomeLbl: NSTextField!
    
    @IBAction func sendMessageBtnClicked(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor.white
    }
    
    override func viewWillAppear() {
        setupView()
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    
    func setupView(){
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor.white
        
        messageOutlineView.wantsLayer = true
        messageOutlineView.layer?.backgroundColor = CGColor.white
        messageOutlineView.layer?.borderColor = NSColor.controlHighlightColor.cgColor
        
        messageOutlineView.layer?.borderWidth = 2
        messageOutlineView.layer?.cornerRadius = 5
        
        sendMessageBtn.styleButtonText(button: sendMessageBtn, buttonName: "Send", fontColor: .darkGray, alignment: .center, font: avenirRegular, size: 13.0)
        
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if UserDataService.instance.isLoggedIn {
            DispatchQueue.main.async {
                self.welcomeLbl.stringValue = "Welcome " + UserDataService.instance.name + "! Start chatting :)"
            }
        }
    }
    
    
}

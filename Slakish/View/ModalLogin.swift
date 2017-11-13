//
//  ModalLogin.swift
//  Slakish
//
//  Created by BootCamp on 11/10/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Cocoa
import ADAL

class ModalLogin: NSView {

    @IBOutlet weak var view: NSView!
    
    @IBOutlet weak var userNameTxt: NSTextField!
    @IBOutlet weak var passwordTxt: NSSecureTextField!
    @IBOutlet weak var emailLoginBtn: NSButton!
    @IBOutlet weak var adalLoginBtn: NSButton!
    
    @IBOutlet weak var createAccountBtn: NSButton!
    
    @IBOutlet weak var stackView: NSStackView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed(NSNib.Name(rawValue: "ModalLogin"), owner: self, topLevelObjects: nil)
        
        self.addSubview(self.view)
        
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        setUpView()
    }
    
    
    @IBAction func closeModalClicked(_ sender: Any) {
    }
    
    @IBAction func adalLoginClicked(_ sender: Any) {
        
        let authContext = ADAuthenticationContext(authority: "https://login.microsoftonline.com/common/oauth2/nativeclient",
                                                  error: nil)
        authContext!.acquireToken(withResource: "00000003-0000-0000-c000-000000000000",
                                  clientId: "4f54b052-2d16-4e7d-8ebe-c0b6338b43d2",
                                  redirectUri: URL(string: "msal4f54b052-2d16-4e7d-8ebe-c0b6338b43d2://auth"))
        {
            (result) in
            
            if (result!.status != AD_SUCCEEDED)
            {
                print("######################## AD SUCCEEDED ###############")
                if result!.error.domain == ADAuthenticationErrorDomain
                    && result!.error.code == ADErrorCode.ERROR_UNEXPECTED.rawValue {
                    
                    print("Unexpected internal error occured");
                    
                } else {
                    
                    print("######################## DID NOT SUCCEED, RESULT: ###############")
                    print("############ RESULT ERROR DESCRIPTION ##############")
                    print(result!.error.description)
                }
                
                return;
            }
            
            var expiresOnString = "(nil)"
            
            if let expiresOn = result!.tokenCacheItem.expiresOn {
                expiresOnString = String(describing: expiresOn)
            }
            
            let status = String(format: "Access token: %@\nexpiration:%@", result!.accessToken, expiresOnString)
            print(status)
            
            let userFullName = (result!.tokenCacheItem.userInformation?.givenName)! + " " + (result!.tokenCacheItem.userInformation?.familyName)!
            print(userFullName)
            
        }
        
        
    }
    
    @IBAction func emailLoginBtnClicked(_ sender: Any) {
    }
    
    @IBAction func createAccountBtnClicked(_ sender: Any) {
    }
    
    
    func setUpView(){
        self.view.frame = NSRect(x: 0, y: 0, width: 475, height: 300)
        view.layer?.backgroundColor = CGColor.white
        view.layer?.cornerRadius = 7
        
        emailLoginBtn.layer?.backgroundColor = chatGreen.cgColor
        emailLoginBtn.layer?.cornerRadius = 7
        emailLoginBtn.styleButtonText(button: emailLoginBtn, buttonName: "Login", fontColor: .white, alignment: .center, font: avenirRegular, size: 14.0)
        
        createAccountBtn.styleButtonText(button: createAccountBtn, buttonName: "Create Account", fontColor: chatGreen, alignment: .center, font: avenirRegular, size: 12.0)
        
        
        adalLoginBtn.styleButtonText(button: adalLoginBtn, buttonName: "Microsoft Account", fontColor: NSColor.systemBlue, alignment: .center, font: avenirRegular, size: 13.0)
        
    }
    
}

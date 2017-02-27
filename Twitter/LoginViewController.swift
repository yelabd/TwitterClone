//
//  LoginViewController.swift
//  Twitter
//
//  Created by Youssef Elabd on 2/26/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       @IBAction func onLoginButton(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: URL(string: "https://api.twitter.com")!, consumerKey: "ITAlNcYUNcl1lcDbkI2PeJB53", consumerSecret: "RPRDAzafa2hz5s3LD81uYnBX2cDaSz0CYxGwk99UstOot44yh2")
        
        twitterClient!.deauthorize()
        
        //let tempURL = URL(string: "https://google.com")!
        
        twitterClient!.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "twitterClone://oauth") , scope: nil, success: { (requestToken: BDBOAuth1Credential?) -> Void in
            print("token obtained")
            print(requestToken!.token)
            let token = requestToken!.token
            
            let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(token!)")
            //let url = URL(string: "https://google.com")
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            
        }, failure: { (error : Error?) -> Void in
            print(error!.localizedDescription)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

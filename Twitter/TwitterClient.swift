//
//  TwitterClient.swift
//  Twitter
//
//  Created by Youssef Elabd on 2/27/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import BDBOAuth1Manager
import SwiftyJSON

class TwitterClient: BDBOAuth1SessionManager {
    
    static let sharedInstance = TwitterClient(baseURL: URL(string: "https://api.twitter.com")!, consumerKey: "ITAlNcYUNcl1lcDbkI2PeJB53", consumerSecret: "RPRDAzafa2hz5s3LD81uYnBX2cDaSz0CYxGwk99UstOot44yh2")
    
    func homeTimeLine(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()){
        get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask,response: Any?) in
            //print(response!)
            let json = JSON(response!).arrayValue
            
            let tweets = Tweet.tweetsWithArray(jsons: json)
            
            success(tweets)
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            failure(error)
        })

    }
    
    func currentAccount(){
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask,response: Any?) in
            //print(response!)
            let json = JSON(response!)
            let user = User(json: json)
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            
        })

    }


}

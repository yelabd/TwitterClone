//
//  User.swift
//  Twitter
//
//  Created by Youssef Elabd on 2/27/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: NSObject {

    var name: String = ""
    var screenname: String = ""
    var desc: String = ""
    var profileUrl: URL?
    var profileUrlStirng : String?
    
    init(json : JSON){
        self.name = json["name"].stringValue
        self.desc = json["description"].stringValue
        self.screenname = json["screen_name"].stringValue
        self.profileUrlStirng = json["profile_image_url_https"].stringValue
        
        if let profileUrlStirng = profileUrlStirng{
            print(profileUrlStirng)
            self.profileUrl = URL(string: profileUrlStirng)
        }
        
        print(self.name)
        print(self.desc)
        print(self.screenname)



        
    
    }
}

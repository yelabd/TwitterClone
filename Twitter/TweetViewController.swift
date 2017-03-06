//
//  TweetViewController.swift
//  Twitter
//
//  Created by Youssef Elabd on 3/5/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    
    var tweet : Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(tweet!.username)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

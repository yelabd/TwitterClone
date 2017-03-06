//
//  MainViewController.swift
//  Twitter
//
//  Created by Youssef Elabd on 2/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allTweets: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        let banner = UIImage(named: "TwitterLogoBlue")
        let imageView = UIImageView(image:banner)
        var bannerWidth = navigationController?.navigationBar.frame.size.width
        var bannerHeight = navigationController?.navigationBar.frame.size.height
        var bannerx = (bannerWidth! / 2 - banner!.size.width / 2)
        var bannery = bannerHeight! / 2 - banner!.size.height / 2
        imageView.frame = CGRect(x: bannerx, y: bannery, width: bannerWidth!, height: bannerHeight!)
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.navigationItem.titleView = imageView

        TwitterClient.sharedInstance?.homeTimeLine(success: { (tweets: [Tweet]) in
            self.allTweets = tweets
            var i = 0;
            
            for tweet in tweets{
                //print("Number \(i)")
                //print(tweet.text)
                self.allTweets.append(tweet)
                i += 1
            }
            self.tableView.reloadData()
        }, failure: { (error: Error) in
            print(error.localizedDescription)
        })
        
        //print(allTweets.count)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .default
        

    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        TwitterClient.sharedInstance?.logout()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return allTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        let row = indexPath.row
        
        let tweetInfo = self.allTweets[row]
        
        //cell.descLabel.text = tweetInfo.text
        print(tweetInfo.text)
        
               //        if (businessInfo.rating < 4.0 && businessInfo.rating > 2){
        //            let yellowColor = UIColor(red: 255/255.0, green: 223/255.0, blue: 0/255.0, alpha: 1.0)
        //            cell.ratingView.backgroundColor = yellowColor
        //        }else if(businessInfo.rating <= 2){
        //            cell.ratingView.backgroundColor = UIColor.red
        //        }
        
        
        //cell.business = businessInfo
        
        cell.tweet = tweetInfo
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tweetSegue" {
            let cell = sender as! TweetCell
            
            let destination = segue.destination as! TweetViewController
            
            let row = self.tableView.indexPath(for: cell)?.row
            
            let tweet = self.allTweets[row!]
            destination.tweet = tweet
        }
        
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

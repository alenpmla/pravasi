//
//  ViewController.swift
//  Janam TV Live Streaming
//
//  Created by Alen John Abraham on 12/05/16.
//  Copyright © 2016 Alen John Abraham. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
    var play_url:String=""
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.barTintColor=UIColor.blackColor()
        nav?.tintColor = UIColor.orangeColor()
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getplayurl()
    
    }
    
    func getplayurl(){
        
        
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        myActivityIndicator.center = view.center
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        
        Alamofire.request(.GET, "http://demo.5centscdn.com/apkxml/pravasi.json", parameters: ["foo": "bar"])
            .response { request, response, data, error in
                
                //    print(request)
                //   print(data)
                //   print(response)
                
                let json = JSON(data: data!)
                self.play_url = json["boxapi"]["playurl"].stringValue
                
                print(self.play_url)
             
  myActivityIndicator.removeFromSuperview()
        
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func HighQuality(sender: UIButton)
    {
        let videoURL = NSURL(string: play_url)
        let player = AVPlayer(URL: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.presentViewController(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
  
    }
    @IBAction func PlayLowQuality(sender: UIButton) {
        let videoURL = NSURL(string: play_url)
        let player = AVPlayer(URL: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.presentViewController(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        
    }

    @IBAction func playMediumQuality(sender: UIButton) {
        print("medium clicked")
        let videoURL = NSURL(string: play_url)
        let player = AVPlayer(URL: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.presentViewController(playerViewController, animated: true) {
            playerViewController.player!.play()
        }

    }
}


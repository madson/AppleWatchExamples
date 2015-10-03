//
//  AppDelegate.swift
//  Examples
//
//  Created by Madson Cardoso on 9/26/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import UIKit
import WatchConnectivity
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var backgroundUpdateTask: UIBackgroundTaskIdentifier!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if WCSession.isSupported() {
            let sessao = WCSession.defaultSession()
            sessao.delegate = self;
            sessao.activateSession()
        }
        
        return true
    }
    
    // MARK: - WCSessionDelegate

    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        var resposta = [String : AnyObject]()
        
        guard
            let solicitacao = message["solicitacao"] as? String
            else {
                replyHandler(resposta)
                return
        }

        self.beginBackgroundUpdateTask()

        if solicitacao == "cidade" {
            
            let url = NSURL(string: "http://www.telize.com/geoip")
            let request = NSURLRequest(URL: url!)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                (data, response, error) in
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                    
                    if let cidade = json["city"] as? String {
                        resposta["cidade"] = cidade
                        replyHandler(resposta)
                    }
                    
                }
                catch {
                    print("Aconteceu algum erro na requisição")
                }
                
                self.endBackgroundUpdateTask()
            }
            
            task.resume()
        }
        else {
            replyHandler(resposta)
        }
        
    } // end fund
    
    func beginBackgroundUpdateTask() {
        
        self.backgroundUpdateTask = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({
            self.endBackgroundUpdateTask()
        })
        
    }

    
    func endBackgroundUpdateTask() {
        
        if self.backgroundUpdateTask != UIBackgroundTaskInvalid {
            UIApplication.sharedApplication().endBackgroundTask(self.backgroundUpdateTask)
            self.backgroundUpdateTask = UIBackgroundTaskInvalid
        }
        
    }

}


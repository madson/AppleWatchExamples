//
//  HaddadInterfaceController.swift
//  Examples
//
//  Created by Madson Cardoso on 9/28/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

typealias TipoBloco = (NSData?, NSURLResponse?, NSError?) -> (Void)
typealias TipoReply = ([String : AnyObject]) -> (Void)
typealias TipoError = (NSError) -> (Void)

class GeoipInterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet var labelGeoip: WKInterfaceLabel!
    @IBOutlet var labelCidade: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if WCSession.isSupported() {
            let sessao = WCSession.defaultSession()
            sessao.delegate = self
            sessao.activateSession()
        }
    }
    
    override func willActivate() {
        self.getGeoip()
        self.getCidade()
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    func getGeoip() {
        
        // Obtendo o ip no watch
        self.labelGeoip.setText("Carregando ip...")
        
        let url = NSURL(string: "http://www.telize.com/geoip")
        let request = NSURLRequest(URL: url!)

        let bloco: TipoBloco = {
            
            (data, response, error) in
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                print("json recebido no watch: \(json)")
                
                guard
                    let ip = json["city"] as? String
                    else {
                        print("guard falhou")
                        return
                }
                
                WKInterfaceDevice.currentDevice().playHaptic(.Success)
                self.labelGeoip.setText(ip)
            }
            catch {
                print("Aconteceu algum erro na requisição")
            }
            
        }

        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: bloco)
        
        task.resume()
    } // end getGeoip()
        
    func getCidade() {
        
        self.labelCidade.setText("Carregando cidade...")
        
        let blocoReply: TipoReply = {
            (response) in
            
            print("dicionario recebido do iphone: \(response)")
            
            guard
                let cidade = response["cidade"] as? String
                else {
                    print("guard falhou")
                    return
            }
            
            WKInterfaceDevice.currentDevice().playHaptic(.Success)
            self.labelCidade.setText(cidade)
        }
        
        let blocoError: TipoError = {
            (error) in
            
            print("Aconteceu algum erro na comunicação: \(error)")
        }
        
        var dicionario = [String : AnyObject]()
        dicionario["solicitacao"] = "cidade"
        
        WCSession.defaultSession().sendMessage(dicionario, replyHandler: blocoReply, errorHandler: blocoError)
    }
    
}

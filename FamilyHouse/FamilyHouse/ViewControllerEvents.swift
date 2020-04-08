//
//  ViewControllerEvents.swift
//  test3
//
//  Created by Jeffrey Seaman on 3/15/20.
//  Copyright © 2020 PPU. All rights reserved.
//

import UIKit

class ViewControllerEvents: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = .familyhouseBlue
        navBar?.tintColor = UIColor.white
        navBar?.isTranslucent = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    

   
}

let configuration = NSURLSessionConfiguration .defaultSessionConfiguration()
   let session = NSURLSession(configuration: configuration)


   let urlString = NSString(format: "//url here\\")

   print("get wallet balance url string is \(urlString)")
   //let url = NSURL(string: urlString as String)
   let request : NSMutableURLRequest = NSMutableURLRequest()
   request.URL = NSURL(string: NSString(format: "%@", urlString) as String)
   request.HTTPMethod = "GET"
   request.timeoutInterval = 30

   request.addValue("application/json", forHTTPHeaderField: "Content-Type")
   request.addValue("application/json", forHTTPHeaderField: "Accept")

   let dataTask = session.dataTaskWithRequest(request) {
       (let data: NSData?, let response: NSURLResponse?, let error: NSError?) -> Void in

       // 1: Check HTTP Response for successful GET request
       guard let httpResponse = response as? NSHTTPURLResponse, receivedData = data
           else {
               print("error: not a valid http response")
               return
       }

       switch (httpResponse.statusCode)
       {
       case 200:

           let response = NSString (data: receivedData, encoding: NSUTF8StringEncoding)
           print("response is \(response)")


           do {
               let getResponse = try NSJSONSerialization.JSONObjectWithData(receivedData, options: .AllowFragments)

               EZLoadingActivity .hide()

              // }
           } catch {
               print("error serializing JSON: \(error)")
           }

           break
       case 400:

           break
       default:
           print("wallet GET request got response \(httpResponse.statusCode)")
       }
   }
   dataTask.resume()

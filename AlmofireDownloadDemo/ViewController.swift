//
//  ViewController.swift
//  AlmofireDownloadDemo
//
//  Created by Xiaodan Wang on 2/1/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0
        
        //downloadJson()
        downloadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func downloadJson() {
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
    }
    
    func downloadImage() {
        
        Alamofire.request("https://upload.wikimedia.org/wikipedia/commons/1/1c/Earth_surface_NGDC_2000.jpg").downloadProgress(closure: { (progress) in
            print(progress.fractionCompleted)
            self.progressBar.progress = Float(progress.fractionCompleted)
            
        }).responseData { (response) in
            print(response.result)
            print(response.result.value)
            
            if let data = response.result.value {
                self.imgView.image = UIImage(data: data)
            }
            
        }
        
        
        
    }
    

}


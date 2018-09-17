//
//  ViewController.swift
//  Learn Moya
//
//  Created by veera reddy on 17/09/18.
//  Copyright © 2018 veera reddy. All rights reserved.
//

import UIKit
import  Moya
class ViewController: UIViewController {
    let serviceManager = MoyaProvider<DataServices>()
    override func viewDidLoad() {
        super.viewDidLoad()
        //let loginParameters = ["email" : "7435550035","password":"12345678"]
       // path :- /hub,/settings get methods
        serviceManager.request(.getUsers(path: "/settings")) { (result) in
           print(result)
            switch result {
            case .success(let response):
                print(response)
                print(String(data: response.data, encoding: String.Encoding.utf8) ?? "")
                let jsonData = try! JSONSerialization.jsonObject(with: response.data, options: [])
                print(jsonData)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


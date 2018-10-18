//
//  ViewController.swift
//  LogJam
//
//  Created by n8glenn on 10/16/2018.
//  Copyright (c) 2018 n8glenn. All rights reserved.
//

import UIKit
import LogJam

class ViewController: UIViewController
{
    let domain:String = "ViewController"
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.f
        
        LogJam.shared.active = true
        LogJam.shared.level = .Information
        LogJam.shared.currentDomain = self.domain + ".viewDidLoad"
        LogJam.shared.addDomain(domain: self.domain + ".viewDidLoad")
        
        LogJam.shared.log(message: "hello there LogJam!!!")
        LogJam.shared.log(level: .Information, message: "Information Message")
        LogJam.shared.log(level: .Debug, message: "Debug Message")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


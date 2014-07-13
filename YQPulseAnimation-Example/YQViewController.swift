//
//  YQViewController.swift
//  YQPulseAnimation-Example
//
//  Created by yiqin on 7/12/14.
//  Copyright (c) 2014 yipick. All rights reserved.
//

import UIKit

class YQViewController: UIViewController {
    
    var pulsingLayer = YQPulsingLayer()
    @IBOutlet var objectView : UIImageView = nil
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pulsingLayer.position = self.objectView.center
        self.view.layer.insertSublayer(pulsingLayer, below: objectView.layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


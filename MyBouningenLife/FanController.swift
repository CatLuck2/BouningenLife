//
//  FanController.swift
//  MyBouningenLife
//
//  Created by CatLuck2 on 2018/09/03.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit

class FanController: UIViewController {
    
    //扇風機のカウント変数
    var count_Fan = 0.0
    
    //電源のフラグ変数
    var flag = 0
    
    @IBAction func homeButton(_ sender: Any) {
        if flag != 0 {
            let viewcontroller = self.presentingViewController as! ViewController
            viewcontroller.count_Fan = 0.0
            viewcontroller.count_Fan += count_Fan
        } else if flag != 1 {
            let viewcontroller = self.presentingViewController as! ViewController
            viewcontroller.count_Fan = 0.0
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func lowLevel(_ sender: Any) {
        if flag != 0 {
            count_Fan = -0.2
        }
    }
    
    @IBAction func standardLevel(_ sender: Any) {
        if flag != 0 {
            count_Fan = -0.4
        }
    }
    
    @IBAction func highLevel(_ sender: Any) {
        if flag != 0 {
            count_Fan = -0.6
        }
    }
    
    @IBAction func powerOfFan(_ sender: Any) {
        if flag == 0 {
            //電源をON
            flag = 1
        } else if flag == 1 {
            //電源をOFF
            flag = 0
            count_Fan = 0.0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //電源のON/OFF
    func powerOfFun() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

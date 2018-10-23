//
//  RemoteController.swift
//  MyBouningenLife
//
//  Created by CatLuck2 on 2018/09/03.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit

class RemoteController: UIViewController {
    
    //精神のカウント変数
    var count_mental = 0
    
    //ON/OFFを示すフラグ変数
    var flag = 0
    
    @IBAction func homeButton(_ sender: Any) {
        if flag != 0 {
            let viewcontroller = self.presentingViewController as! ViewController
            viewcontroller.count_mental = -1
            viewcontroller.count_mental += count_mental
        } else if flag != 1 {
            let viewcontroller = self.presentingViewController as! ViewController
            viewcontroller.count_mental = -1
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func channelA(_ sender: Any) {
        if flag != 0 {
            count_mental = 1
        }
    }
    
    @IBAction func channelB(_ sender: Any) {
        if flag != 0 {
            count_mental = -1
        }
    }
    
    @IBAction func channnelC(_ sender: Any) {
        if flag != 0 {
            count_mental = -2
        }
    }
    
    @IBAction func powerOfRemote(_ sender: Any) {
        if flag == 0 {
            //電源をON
            flag = 1
        } else if flag == 1 {
            //電源をOFF
            flag = 0
            count_mental = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

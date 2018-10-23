//
//  ACController.swift
//  MyBouningenLife
//
//  Created by CatLuck2 on 2018/09/03.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit

class ACController: UIViewController {
    
    //エアコンの設定温度
    var selectedAC = 25.0
    
    //エアコンのカウント変数
    var count_AC = 0.0
    
    //風向きのカウント変数
    var count_direction = 0.0
    
    //風量のカウント変数
    var count_amount = 0.0
    
    //冷房または暖房かを示す
    var cool_or_hot = 1
    
    //エアコンのON/OFFを判断する
    var flag = 0
    
    //風向
    var direction = [0.2, 0.4, 0.6]
    
    //風向き用の指定変数
    var i1 = 0
    
    //風量
    var amount = [0.2, 0.4, 0.6]

    //風量用の指定変数
    var i2 = 0
    
    
    @IBOutlet weak var Temperature: UILabel!
    
    @IBOutlet weak var directionLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBAction func homeButton(_ sender: Any) {
        if flag != 0 {
            //設定したポイントを加算する
            if cool_or_hot == 1 {
                count_AC = (-1.0 + -count_direction + -count_amount)
            } else if cool_or_hot == 2 {
                count_AC = (1.0 + count_direction + count_amount)
            }
            //ViewControllerのインスタンスを生成
            let viewcontroller = self.presentingViewController as! ViewController
            viewcontroller.selecetedAC = self.selectedAC
            viewcontroller.count_AC = 0.0
            viewcontroller.count_AC += self.count_AC
        } else if flag != 1 {
            let viewcontroller = self.presentingViewController as! ViewController
            viewcontroller.selecetedAC = 0.0
            viewcontroller.count_AC = 0.0
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func cool(_ sender: Any) {
        if flag != 0 {
            cool_or_hot = 1
            Temperature.text! = "冷房 \(selectedAC)"
        }
    }
    
    @IBAction func hot(_ sender: Any) {
        if flag != 0 {
            cool_or_hot = 2
            Temperature.text! = "暖房 \(selectedAC)"
        }
    }
    
    @IBAction func upTemperature(_ sender: Any) {
        if flag != 0 {
            selectedAC += 0.5
            Temperature.text! = String(selectedAC)
        }
    }
    
    @IBAction func downTemperature(_ sender: Any) {
        if flag != 0 {
            selectedAC -= 0.5
            Temperature.text! = String(selectedAC)
        }
    }
    
    @IBAction func powerOfAC(_ sender: Any) {
        if flag == 0 {
            //電源をON
            flag = 1
        } else if flag == 1 {
            //電源をOFF
            flag = 0
            count_AC = 0
            count_amount = 0
            count_direction = 0
            Temperature.text! = String(selectedAC)
        }
    }
    
    @IBAction func directionOfAC(_ sender: Any) {
        if flag != 0 {
            if i1 == 3 {
                i1 = 0
            }
            count_direction = direction[i1]
            directionLabel.text! = "風向き：\(count_direction)"
            print(count_direction)
            i1 += 1
        }
    }
    
    @IBAction func amountOfAC(_ sender: Any) {
        if flag != 0 {
            if i2 == 3 {
                i2 = 0
            }
            count_amount = amount[i2]
            amountLabel.text! = "風量：\(count_amount)"
            print(count_amount)
            i2 += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

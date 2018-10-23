//
//  ViewController.swift
//  MyBouningenLife
//
//  Created by CatLuck2 on 2018/09/03.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //室内の温度
    var temperature = 27.0
    
    //精神レベル
    var mental = 10
    
    //室温のカウント変数(エアコン＋扇風機)
    var count_temperature = 1.0
    
    //エアコンのカウント変数
    var count_AC = 0.0
    
    //扇風機のカウント変数
    var count_Fan = 0.0
    
    //カウントで加わる
    var count_mental = -1
    
    //タイマー変数(室温、精神)
    var timer = Timer()
    
    //エアコンの設定温度を受け取る
    var selecetedAC = 0.0
    
    //設定温度と同値の時に処理する
    var flag_equal = 0
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var mentalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //ViewControllerが呼び出されるときに実行
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //ラベルを初期化する
//        temperatureLabel.text! = String(temperature)
//        mentalLabel.text! = String(mental)
        
        self.temperatureLabel.text! = String(self.temperature)
        self.mentalLabel.text! = String(self.mental)
        
        //室温のカウント変数を初期化する
        count_temperature = 1.0
        
        //秒/度を更新する
        self.count_temperature += self.count_AC + self.count_Fan
        
        //5秒ごとに処理を実行する
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    //室温と精神レベルを変化させる処理
    @objc func update() {
        
        //室温処理
        print(count_temperature)
        print(count_AC)
        print(count_Fan)
        
        self.temperature += self.count_temperature
        self.temperatureLabel.text! = String(self.temperature)
        
        //精神処理
        self.mental += self.count_mental
        self.mentalLabel.text! = String(self.mental)
        
        //もし室温が40度を超えたら
        if self.temperature >= 40.0 {
            timer.invalidate()
            performSegue(withIdentifier: "GameOver", sender: self)
        }
        
        //もし室温が0度を下回ったら
        if self.temperature <= 0.0 {
            timer.invalidate()
            performSegue(withIdentifier: "GameOver", sender: self)
        }
        
        //もし精神レベルが0を下回ったら
        if self.mental <= 0 {
            timer.invalidate()
            performSegue(withIdentifier: "GameOver", sender: self)
        }
        
    }
    
    //もしエアコンの設定温度と室温が同値になれば
    func epual_temperature() {
        if count_AC > 0.0 {
            if temperature <= selecetedAC {
                count_AC /= 2.0
            }
        } else if count_AC < 0.0 {
            if temperature >= selecetedAC {
                count_AC /= 2.0
            }
        }
    }
    
    //遷移するときに実行
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //エアコンへ遷移するとき
        switch segue.identifier {
        case "goAC":
            print("AC \(temperature)")
            print("AC \(count_temperature)")
            timer.invalidate()
        case "goFan":
            print("Fan\(temperature)")
            print("Fan \(count_temperature)")
            timer.invalidate()
        case "goRemote":
            print("Remote \(temperature)")
            print("Remote \(count_temperature)")
            timer.invalidate()
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


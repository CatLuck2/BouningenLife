//
//  EndViewController.swift
//  MyBouningenLife
//
//  Created by CatLuck2 on 2018/09/04.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit
import AVFoundation

class EndViewController: UIViewController {
    
    @IBAction func continueButton(_ sender: Any) {
        //遷移する
        performSegue(withIdentifier: "CONTINUE", sender: self)
    }
    
    //AVAudioPlayerのインスタンスを生成
    var audioplayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //音源ファイルのパスを設定
        let url = Bundle.main.url(forResource: "鐘", withExtension: "mp3")
        
        //音源ファイルを再生
        do {
            audioplayer = try AVAudioPlayer(contentsOf: url!)
            audioplayer.play()
        } catch {
            print("エラーが発生しました")
        }

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CONTINUE" {
            //ViewControllerのインスんタンスを生成
            let viewcontroller = segue.destination as! ViewController
            //遷移先のプロパティを初期化
            viewcontroller.temperature = 27.0
            viewcontroller.mental = 10
        }
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

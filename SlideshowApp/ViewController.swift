//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 高橋子竜 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    let imageName = ["0","1","2","3","4"] // 3つの画像を代入
    var changeImage = 0 //changeImageに0を代入
    var timer: Timer! // タイマー
    var timer_sec: Float = 0 // タイマー用の時間のための変数

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        
        if changeImage > 3 {
           changeImage = 0
        }
       
        changeImage += 1
        
        let name = imageName[changeImage]
        imageView.image = UIImage(named: name)
    }
    
    
    //進むボタン
    @IBAction func go(_ sender: Any) {
        if changeImage > 3 {
           changeImage = 0
        }
       
        changeImage += 1
        
        let name = imageName[changeImage]
        imageView.image = UIImage(named: name)
    }
    
    
    //戻るボタン
    @IBAction func back(_ sender: Any) {
        if changeImage < 1 {
           changeImage = 4
        }
       
        changeImage -= 1
        
        let name = imageName[changeImage]
        imageView.image = UIImage(named: name)
    }
    
        
    //再生/停止ボタン
    @IBAction func pauseorstart(_ sender: Any) {
        // 再生ボタンを押すとタイマー作成、始動して「戻るボタン」と「進むボタン」をタップできないようにしている
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            backButton.isEnabled = false
            goButton.isEnabled = false
        }
        else if self.timer != nil {
            // タイマーを停止する
            self.timer.invalidate()
            
            // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            self.timer = nil
            
            // 「戻るボタン」と「進むボタン」をタップできるようにしている
            backButton.isEnabled = true
            goButton.isEnabled = true
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
            nextVC.image = imageView.image
        
        if self.timer != nil {
            // タイマーを停止する
            self.timer.invalidate()
            
            // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            self.timer = nil
            
            // 「戻るボタン」と「進むボタン」をタップできるようにしている
            backButton.isEnabled = true
            goButton.isEnabled = true
        }
    }
    
    
    @IBAction func tapImage(_ sender: Any) {
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
}

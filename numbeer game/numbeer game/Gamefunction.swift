//
//  Gamefunction.swift
//  numbeer game
//
//  Created by Enrique Avila on 12.03.20.
//  Copyright © 2020 Enrique Avila. All rights reserved.
//

import UIKit

class Gamefunction: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        
        
    }
    var num1 = 0
    var num2 = 0
    var score = 0
    let minNum = 1
    let maxNum = 10
    
    
    var answer = false
    var totalTime = 2.0
    var time_left = 2.0
    var progress = 1.0
    var time_interval = 0.02
    

    @IBOutlet weak var current_score: UILabel!
    @IBOutlet weak var numbersShowing: UILabel!
    @IBOutlet weak var progessView: UIProgressView!
    
    
    @IBAction func trueButton(_ sender: Any) {
        answer = true
        gameloop()
    }
    @IBAction func falseButton(_ sender: Any) {
        answer = false
        gameloop()
    }
    func setup(){
        score = 0
        totalTime = 2.0
        resetGame()
        count_down()
    }
    
    func resetGame(){
        progress = 1
        num1 = Int(arc4random_uniform(UInt32(maxNum-minNum+1))) + 1
        num2 = Int(arc4random_uniform(UInt32(maxNum-minNum+1))) + 1
        
        numbersShowing.text = "\(num1) > \(num2)"
        
        time_left = totalTime
        if (score % 10) == 0{
            if score != 0{
                totalTime -= 0.5
            }
        }
        progessView.setProgress(Float(progress), animated: false)
    }
    
    
    @objc func count_down(){
        time_left -= time_interval
        progress = time_left / totalTime
        progessView.setProgress(Float(progress), animated: false)
        
        if time_left <= 0{
            performSegue(withIdentifier: "goBack", sender: self)
        }
        
        _ = Timer.scheduledTimer(timeInterval: TimeInterval(0.02), target: self, selector: #selector(count_down), userInfo: nil, repeats: false)
        
    }
    
    func gameloop(){
        if (num1 > num2) == answer{
            score += 1
            current_score.text = "score: \(score)"
            resetGame()
        }
        else{
            performSegue(withIdentifier: "goBack", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goBack"{
               let dest = segue.destination as! ViewController
               dest.score = score
           }
    }
}



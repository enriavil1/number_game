//
//  ViewController.swift
//  numbeer game
//
//  Created by Enrique Avila on 10.03.20.
//  Copyright © 2020 Enrique Avila. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkingScore()
    }
    
    //shows the next screen as a full screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let navigationController = segue.destination
        navigationController.modalPresentationStyle = .fullScreen
    }

    @IBOutlet weak var bestScore: UILabel!
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue){}
    
    var score  = 0
    var _bestScore = 0
    
    @objc func checkingScore(){
        bestScore.numberOfLines = 0
        _ = Timer.scheduledTimer(timeInterval: TimeInterval(0.002), target: self, selector: #selector(checkingScore), userInfo: nil, repeats: false)
        if score > _bestScore{
            _bestScore = score
            bestScore.text = "Your new best score is: \(_bestScore)!"
            view.backgroundColor = UIColor.green
        }
        if score < _bestScore{
            view.backgroundColor = UIColor.red
            bestScore.text = "You couldn\'t beat your \n best score of \(_bestScore)"
            
        }
    }
}


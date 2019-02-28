//
//  StatisticsViewController.swift
//  Guesser
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

   
    

    @IBOutlet weak var minLBL: UILabel!
    
    @IBOutlet weak var maxLBL: UILabel!
    
    @IBOutlet weak var meanLBL: UILabel!
    
    @IBOutlet weak var stdDevLBL: UILabel!
    
    
    @IBAction func clearStatisticsBTN(_ sender: Any) {
        minLBL.text = "0"
        maxLBL.text = "0"
        meanLBL.text = "0"
        stdDevLBL.text = "0"
        Guesser.shared.clearStatistics()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelValues()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        labelValues()
    }
    
    
    func labelValues() {
        minLBL.text = String(Guesser.shared.minimumNumAttempts())
        maxLBL.text = String(Guesser.shared.maximumNumAttempts())
        meanLBL.text = String(Guesser.shared.mean())
        stdDevLBL.text = String(Guesser.shared.stdDev())
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

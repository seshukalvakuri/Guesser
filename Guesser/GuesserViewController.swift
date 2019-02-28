//
//  FirstViewController.swift
//  Guesser
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class GuesserViewController: UIViewController {
    
    @IBOutlet weak var myGuessTF: UITextField!
    
    @IBOutlet weak var hintLBL: UILabel!
    
    
    @IBAction func amIRightBTN(_ sender: Any) {
        if let alphabets = Int(myGuessTF.text!) {
        let result = Guesser.shared.amIRight(_guess: alphabets)
        if result == Result.correct {
            hintLBL.text = result.rawValue
            displayMessage()
            Guesser.shared.createNewProblem()
        }
        else {
            hintLBL.text = result.rawValue
        }
        }
        else {
            hintLBL.text = "not a valid input"
        }
    }
    
    @IBAction func createNewProblemBTN(_ sender: Any) {
        myGuessTF.text = ""
        hintLBL.text = ""
        Guesser.shared.createNewProblem()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Guesser.shared.createNewProblem()
    }

    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}


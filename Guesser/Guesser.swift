//
//  Guesser.swift
//  Guesser
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation



class Guesser {
    private var correctAnswer:Int
    private var _numAttempts:Int
    private var guesses: [Guess]
    public struct Guess {
        var correctAnswer:Int
        var numAttemptsRequired:Int
    }
    var numAttempts:Int{return _numAttempts }
    
//    private init(correctAnswer:Int, _numAttempts:Int, guesses:[Guess]){
//        self.correctAnswer = correctAnswer
//        self._numAttempts = _numAttempts
//        self.guesses = guesses
//    }
    static var shared = Guesser()
    
    private init(){
               self.correctAnswer = 0
               self._numAttempts = 0
                self.guesses = []
           }
    
    func createNewProblem() {
        correctAnswer = Int.random(in: 1...10)
        _numAttempts = 0
    }
    
    func amIRight(_guess: Int) -> Result {
        _numAttempts = _numAttempts+1
        if _guess > correctAnswer {
            return Result.tooHigh
        }
        else if _guess < correctAnswer {
            return Result.tooLow
        }
        else {
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
            return Result.correct
        }
        
    }
    
    func guess(index:Int) -> Guess {
        return guesses[index]
    }
    
    
    
    func minimumNumAttempts() -> Int {
        if guesses.isEmpty{
            return 0
        }
        else{
        var min  = guesses[0].numAttemptsRequired
        for i in guesses {
            if min > i.numAttemptsRequired {
                    min = i.numAttemptsRequired
            }
        }
        return min
        }
    }

    func maximumNumAttempts() -> Int {
        if guesses.isEmpty{
            return 0
        }
        else{
        var max  = guesses[0].numAttemptsRequired
        for i in guesses {
            if max < i.numAttemptsRequired {
                max = i.numAttemptsRequired
            }
        }
        return max
        }
    }
    
    func mean() -> Double {
        var count = 0
        if guesses.isEmpty{
            return 0
        }
        else{
        for i in guesses {
            count += i.numAttemptsRequired
        }
        return Double(count)/Double(guesses.count)
        }
    }
    
    func stdDev() -> Double {
        if guesses.isEmpty{
            return 0
        }
        else {
        var sum = 0.0
        for i in 0..<Guesser.shared.numGuesses() {
            sum = sum + pow(Double(guess(index: i).numAttemptsRequired) - mean(),2)
        }
        let stdDev = sum/Double(numGuesses())
        return sqrt(stdDev)
        }
    }
    
    func numGuesses() -> Int {
        return guesses.count
        
    }
    
    func clearStatistics(){
        guesses = []
    }
    
}

enum Result:String {case tooLow = "TooLow", tooHigh = "TooHigh", correct = "Correct"}

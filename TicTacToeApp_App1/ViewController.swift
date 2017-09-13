//
//  ViewController.swift
//  TicTacToeApp_App1
//
//  Created by Lucia Huo on 2017-09-11.
//  Copyright © 2017 Lucia Huo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //set initial turn to circle object
    var turn = 1
    
    //keep track of state for each button; 0 being unused, 1 being circle, 2 being cross
    var buttonState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    //winning combinations of tags
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]]
    
    //bool keeping track of game state
    var gameActive = true
    
    //keep track of scores of the players 
    var crossPt = 0
    
    var circlePt = 0

    @IBOutlet weak var winningPlayer: UILabel!
    
    @IBOutlet weak var crossScore: UITextField!
    
    @IBOutlet weak var circleScore: UITextField!
    
    @IBAction func action(_ sender: AnyObject)
    {
        //only update button if the state is unused
        if (buttonState[sender.tag - 1] == 0)
        {
            //when players begin playing, change the label
            winningPlayer.text = "playing..."
            
            if (turn == 1) {
                sender.setImage(UIImage(named: "o.png"), for: UIControlState())
                buttonState[sender.tag - 1] = 1 //update the state circle
                turn = 2 //change to cross
            }
            else
            {
                sender.setImage(UIImage(named: "x.png"), for: UIControlState())
                buttonState[sender.tag - 1] = 2 //update the state to cross
                turn = 1 // change to circle
            }
        }
        //after each player moves, check if there are winning combinations
        for combination in winningCombinations
        {
            if (buttonState[combination[0]] != 0
                && buttonState[combination[0]] == buttonState[combination[1]]
                && buttonState[combination[1]] == buttonState[combination[2]])
            {
                gameActive = false
                
                if (buttonState[combination[0]] == 1) {
                    winningPlayer.text = "circle has won!"
                    circlePt = circlePt + 1
                    circleScore.text = String(circlePt)
                }
                else
                {
                    winningPlayer.text = "cross has won!"
                    crossPt = crossPt + 1
                    crossScore.text = String(crossPt)
                }
            }
        }
    }
    
    @IBOutlet weak var reset: UIButton!
    
    //reset the entire game
    @IBAction func reset(_ sender: AnyObject)
    {
        buttonState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        turn = 1 //Circle always goes first 
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        winningPlayer.text = "{welcome}"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


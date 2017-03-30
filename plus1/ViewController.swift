//
//  ViewController.swift
//  plus1
//
//  Created by Bror Brurberg on 27.03.2017.
//  Copyright © 2017 Bror Brurberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //: Labels
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var loLabel: UILabel!
    
    //: i is a var that keeps count
    var i = 0
    //: sets a default, if the app is totally exited
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // sets contents of the statusbar to light
        UIApplication.shared.statusBarStyle = .lightContent
        //: tries to find old number
        let oldNumber:Int? = userDefaults.integer(forKey: "number") as Int?
        //sets oldNumber to zero, if it cant find any value
        if oldNumber == nil {
            i = 0
            lable.text = String(i)
            //sets new default to i (0)
            userDefaults.set(i, forKey: "number")
        }
        else {
            //if oldNumber has a value set i = to oldNumber
            i = oldNumber!
            lable.text = String(i)
        }
    }
    
    // easteregg
    func lol() {
        if i == 100 {
           loLabel.text = "ONE HUNDRER THINGS! 😐💯"
        }
        else if i == 12 {
            loLabel.text = "One dozen eggs 🥚"
        }
        else if i == 6 {
            loLabel.text = "😏"
        }
        else {
            loLabel.text = ""
        }
    }
    
    // function that saves the int i, with the key number.
    func save() {
        let numberToSave:Int = i
        // sets userDefault value
        userDefaults.set(numberToSave, forKey: "number")
        userDefaults.synchronize()
    }
    
    // Alertbox
    @IBAction func showAlert() {
        // sets title and message for alertbox
        let alert = UIAlertController(title: "Reset?", message: "Are you sure you want to reset?", preferredStyle: .actionSheet)
        // cancel action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action in
            return
        })
        // reset/confirm action
        alert.addAction(UIAlertAction(title: "Reset", style: .default) {action in
            // code that runs if clicked
            self.i = 0
            self.lable.text = String(self.i)
            self.save()
            self.lol()
        })
        // shows alertbox
        self.present(alert, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func minusOne(_ sender: UIButton) {
        // substarct one from lable
        i -= 1
        lable.text = String(i)
        save()
        lol()
    }

    @IBAction func plusOne(_ sender: UIButton) {
        // add one to lable
        i += 1
        lable.text = String(i)
        save()
        lol()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        //reset button
        showAlert()
    }
    
}


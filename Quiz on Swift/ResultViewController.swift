//
//  ResultViewController.swift
//  Quiz on Swift
//
//  Created by Towa Aoyagi on 2021/02/13.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int = 0

    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "\(String(correctAnswer))問正解！"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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

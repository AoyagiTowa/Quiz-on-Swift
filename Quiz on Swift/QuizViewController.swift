//
//  QuizViewController.swift
//  Quiz on Swift
//
//  Created by Towa Aoyagi on 2021/02/13.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0

    @IBOutlet var quizText: UITextView!
    @IBOutlet var choice1: UIButton!
    @IBOutlet var choice2: UIButton!
    @IBOutlet var choice3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["Zoomのカメラはどこ向き？","右","左","正面",1])
        quizArray.append(["Zoomで設定できる背景壁紙のことをなんという？","壁紙","仮定背景","ヴァーチャル背景",3])
        quizArray.append(["次の内、webブラウザの人間確認の際に出てこないお題は？","信号機","飛行機","ヤシの木",2])
        quizArray.append(["BORってなんの略？","Breaking Outlet Room","Break Out Room","Back Opareting Room",2])
        quizArray.append(["次の内、Zoomに存在しない機能は？","コンピュータの音声だけ共有","画面の録画","スクリーンショット",3])
        quizArray.append(["次の内、共同ホストができないことは？","複数画面共有設定","BORを作る","待機室の参加者受け入れ",2])
        
        quizArray.shuffle()
        choiceQuiz()
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        let tmpArray = quizArray[0] as! [Any]
        quizText.text = tmpArray[0] as? String
        choice1.setTitle(tmpArray[1] as? String, for: .normal)
        choice2.setTitle(tmpArray[2] as? String, for: .normal)
        choice3.setTitle(tmpArray[3] as? String, for: .normal)

    }
    
    @IBAction func choiceAnswer (sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        if tmpArray[4] as! Int == sender.tag {
            correctAnswer += 1
        }
        quizArray.remove(at: 0)
        
        if quizArray.count == 0 {
            performSegue()
        }else {
            choiceQuiz()
        }
        
    }
    
    func performSegue() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
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

//
//  AddController.swift
//  ToDo
//
//  Created by Tomomi Hori on 2022/02/27.
//

import UIKit

var titleArray = [String]()
var detailArray = [String]()
var deadlineArray = [String]()

class AddController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBAction func todoAddButton(_ sender: Any) {

        titleArray.append(titleTextField.text!)
        titleTextField.text = ""
        UserDefaults.standard.set( titleArray, forKey: "TodoList" )
        
        detailArray.append(detailTextView.text!)
        detailTextView.text = ""
        UserDefaults.standard.set( detailArray, forKey: "TodoDetail" )
        
        deadlineArray.append(deadlineLabel.text!)
        deadlineLabel.text = ""
        UserDefaults.standard.set( deadlineArray, forKey: "TodoDeadLine" )
     }
    
    @IBAction func GetDate(_ sender: Any) {
            deadlineLabel.text = "\(picker.date)"
            
        }
    
    @IBAction func backToList(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
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

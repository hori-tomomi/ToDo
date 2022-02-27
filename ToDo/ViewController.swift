//
//  ViewController.swift
//  ToDo
//
//  Created by Tomomi Hori on 2022/02/27.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //戻り値の設定(表示するcell数)
            return titleArray.count
        }

        //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //変数を作る
            let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
            //変数の中身を作る
            TodoCell.textLabel!.text = titleArray[indexPath.row]
            //戻り値の設定（表示する中身)
            return TodoCell
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            titleArray.remove(at: indexPath.row)
            detailArray.remove(at: indexPath.row)
            deadlineArray.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        case .insert, .none:
            // NOP
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            titleArray = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        
        table.reloadData()
        
        /*
        if let bundleId = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleId)
        }*/
    }

     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
     }


}


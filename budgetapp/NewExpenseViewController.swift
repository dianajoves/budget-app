//
//  NewExpenseViewController.swift
//  budgetapp
//
//  Created by Diana Joves on 2/2/18.
//  Copyright © 2018 Diana Joves. All rights reserved.
//

import UIKit

class NewExpenseViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalBudgetLabel: UILabel!
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBAction func addExpenseButton(_ sender: Any) {
        if addTextField.text != ""
        {
            performSegue(withIdentifier: "graphSegue", sender: self)
            
        }
    }
    
    let categories = ["Overview", "Rent", "Groceries", "Gas", "Restaurants", "Entertainment", "Shopping"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    //pass information to graph view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let graphViewController = segue.destination as! GraphViewController
        graphViewController.addString = addTextField.text!
        graphViewController.list.append(addTextField.text!)
        //graphViewController.myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addTextField.keyboardType = UIKeyboardType.decimalPad
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = "\(dateFormatter.string(from:Date() as Date))"
        dateLabel.text = String(dateString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hides the keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

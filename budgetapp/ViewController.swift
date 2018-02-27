//
//  ViewController.swift
//  budgetapp
//
//  Created by Diana Joves on 2/2/18.
//  Copyright © 2018 Diana Joves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var totalBudgetLabel: UILabel!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
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
    
    @IBAction func addButton(_ sender: Any)
    {
        performSegue(withIdentifier: "addSegue", sender: self)
    }
    
    @IBAction func graphButton(_ sender: Any) {
        performSegue(withIdentifier: "graphSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = "\(dateFormatter.string(from:Date() as Date))"
        dateLabel.text = String(dateString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//
//  ViewController.swift
//  Ability Calculator
//
//  Created by Charles on 29/03/2016.
//  Copyright © 2016 Charles Roncier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var race: UITextField!
    
    @IBOutlet weak var numberOfPoints: UISegmentedControl!
    @IBAction func numberOfPointsChoice(sender: UISegmentedControl) {
        if(numberOfPoints.selectedSegmentIndex == 0)
        {
            totalPoints.text = "10";
        }
        else if(numberOfPoints.selectedSegmentIndex == 1)
        {
            totalPoints.text = "15";
        }
        else if(numberOfPoints.selectedSegmentIndex == 2)
        {
            totalPoints.text = "20";
        }
        else if(numberOfPoints.selectedSegmentIndex == 3)
        {
            totalPoints.text = "25";
        }
    }
    
    @IBOutlet weak var basicForce: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperForce(sender: UIStepper) {
        basicForce.text = "\(Int(stepper.value))"
      //  totalPoints.text = "\(Int(totalPoints.text)! + 1)"
        print("\(totalPoints.text)")
    }
    
    
    var pickerRaces: [String] = ["Human", "Dwarf", "Elf", "Gnome", "Half-elf", "Half-orc", "Halfing", "Other"]
    var picker = UIPickerView()
    
    var basicAbilities: [String] = ["7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    var pickerPoints = UIPickerView()
    
    let abilityCosts:[Int:Int] = [7:-4, 8:-2, 9:-1, 10:0, 11:1, 12:12, 13:13, 14:5, 15:7, 16:10, 17:13, 18:17]
   // let abilityMods:[int:Int] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Picker View        
        
        race.delegate = self
        race.inputView = picker
        
        // Connect data:
        picker.dataSource = self
        picker.delegate = self
        
        // Input data from the Array
        race.text = pickerRaces[0]
        
        // Display number of total points by default
        totalPoints.text = "15"
        
    }
    
    // Column count: use one column.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Row count: rows equals array length.
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerRaces.count
    }
    
    // Return a string from the array for this row.
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerRaces[row]

        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            race.text = pickerRaces[row]
            self.view.endEditing(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}



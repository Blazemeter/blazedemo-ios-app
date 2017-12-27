//
//  SelectDestinationViewController.swift
//  BlazeDemo
//
//  Created by Jambu, Vijay on 12/21/17.
//  Copyright © 2017 Jambu, Vijay. All rights reserved.
//

import UIKit

class SelectDestinationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var departurePicker: UIPickerView!
    @IBOutlet weak var destinationPicker: UIPickerView!
    let departure  = ["Paris","Philadelphia","Boston", "Portland", "San Diego" , "Mexico City", "Sao Paolo"]
    let destination  = ["Buenos Aires","Rome","London", "Berlin", "New York" , "Dublin", "Cairo"]
    var selectedDeparture:String?
    var selectedDestination:String?
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        departurePicker.delegate = self
        departurePicker.dataSource = self
        
        destinationPicker.dataSource = self
        destinationPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        //Make a call to backend and also store state ?
        let dept = selectedDeparture ?? departure[0]
        let dest = selectedDestination ?? destination[0]
        NSLog("departure \(dept) destination \(dest)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case departurePicker:
            return departure.count
        case destinationPicker:
            return destination.count
            
        default:
            return 1
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
            case departurePicker:
                return departure[row]
        case destinationPicker:
            return destination[row]
            
        default:
            NSLog("Pickers did not match, this is an issue", pickerView);
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case departurePicker:
            selectedDeparture = departure[row]
        case destinationPicker:
            selectedDestination = destination[row]
        default:
            NSLog("Pickers did not match, this is an issue", pickerView);
        }
    }
}


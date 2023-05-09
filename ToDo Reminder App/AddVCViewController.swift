//
//  AddVCViewController.swift
//  ToDo Reminder App
//
//  Created by Agnivesh Arohi on 10/05/23.
//

import UIKit


class AddVCViewController: UIViewController, UITextFieldDelegate{
    
    

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
   public var completion: ((String, String, Date, String) -> Void)?
    let options = ["Low", "Medium", "High"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        titleField.delegate = self
        bodyField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
      
    }
    @objc func didTapSaveButton(){
        let titleText = titleField.text ?? ""
           let bodyText = bodyField.text ?? ""
            
            let priorityIndex = pickerView.selectedRow(inComponent: 0)
            let priority = options[priorityIndex]
            let targetDate = datePicker.date
            completion?(titleText, bodyText, targetDate, priority)
            
        ToDoTask.instance.addTask(title: titleText, body: bodyText, priority: priority, date: targetDate)
        scheduleLocalNotification(title: titleText, body: bodyText, date: targetDate)
        
    }
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
extension AddVCViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        _ = options[row]
    }
    
}

extension AddVCViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    
}

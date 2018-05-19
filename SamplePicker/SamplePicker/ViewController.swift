//
//  ViewController.swift
//  SamplePicker
//
//  Created by Darshan on 19/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    fileprivate var pickerView = UIPickerView()
    fileprivate let toolbar = UIToolbar()
    
    var tempArray = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6", "Category 7", "Category 8", "Category 9", "Category 10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configurePickerView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configurePickerView() {
            /// PickerView initialize
            pickerView.delegate = self
            pickerView.dataSource = self
            
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
            
            toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            
            textField.inputView = pickerView
            textField.inputAccessoryView = toolbar
        
    }
    
    /**
     This is the selector method and invoked when `Done` button is tapped in toolbar
     */
    @objc func doneButtonTapped() {
        textField.text = tempArray[pickerView.selectedRow(inComponent: 0)]
        self.view.endEditing(true)
    }
    
    /**
     This is the selector method and invoked when `Cancel` button is tapped in toolbar
     */
    @objc func cancelButtonTapped() {
        textField.text = ""
        self.view.endEditing(true)
    }

}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tempArray[row]
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = tempArray[row]
    }
}

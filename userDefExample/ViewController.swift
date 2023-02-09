//
//  ViewController.swift
//  userDefExample
//
//  Created by Aman Verma on 09/02/23.
//

import UIKit

class ViewController: UIViewController {
    struct Keys {
           static let prefersDarkMode  = "prefersDarkMode"
        static let name="Name"
           
       }

    @IBOutlet private weak var textViewField: UITextField!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var toggleThemeButton: UISegmentedControl!
    
    var isDarkMode=false
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForSavedName()
        checkForStylePreference()
        // Do any additional setup after loading the view.
    }

    @IBAction func didStyleSegmentControl(_ sender: UISegmentedControl) {
        isDarkMode=sender.selectedSegmentIndex==1
        updateStyle()
        saveStylePreference()
    }
    @IBAction func saveButton(_ sender: Any) {
        saveName()
    }
    
    //Style Theme
    func updateStyle(){
        UIView.animate(withDuration: 0.4){
            self.view.backgroundColor = self.isDarkMode ? .darkGray : .white
//            self.textViewField.updateStyle(isDarkMode: self.isDarkMode)
            
        }
    }
    func saveStylePreference() {
           defaults.set(isDarkMode, forKey: Keys.prefersDarkMode)
       }
       
       
    func checkForStylePreference() {
           let prefersDarkMode = defaults.bool(forKey: Keys.prefersDarkMode)
           
           if prefersDarkMode {
               isDarkMode = true
               updateStyle()
               toggleThemeButton.selectedSegmentIndex = 1
           }
       }
    //Save Prefernces using USerDefaults
    func saveName(){
        defaults.set(textViewField.text!,forKey:Keys.name)
    }
    
    func checkForSavedName(){
        let name=defaults.value(forKey: Keys.name)as? String ?? ""
        textViewField.text=name
    }
       
       
    
}


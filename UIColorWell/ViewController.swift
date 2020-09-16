//
//  ViewController.swift
//  appClipsTest
//
//  Created by jinhyuk on 2020/09/16.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {

    var selectedÇolor = UILabel()
    let controlWell: UIColorWell = UIColorWell()
    let selectColorView = UIView()
    let pickerBtn: UIButton = UIButton(type: .custom)
    var pickerDelegate: UIColorPickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        selectedÇolor.text = "Select Your Color"
        self.view.addSubview(selectedÇolor)
        
        controlWell.addTarget(self, action: #selector(didSelect(color:)), for: .valueChanged)
        self.view.addSubview(controlWell)
        
        selectColorView.backgroundColor = .white
        selectColorView.layer.cornerRadius = 10
        self.view.addSubview(selectColorView)
        
        pickerBtn.setTitle("Touch to Present UIColorPickerView", for: .normal)
        pickerBtn.backgroundColor = .lightGray
        pickerBtn.layer.cornerRadius = 4
        pickerBtn.addTarget(self, action: #selector(presentColorPickerViewController(_:)), for: .touchUpInside)
        self.view.addSubview(pickerBtn)
        
        
        selectedÇolor.translatesAutoresizingMaskIntoConstraints = false
        controlWell.translatesAutoresizingMaskIntoConstraints = false
        selectColorView.translatesAutoresizingMaskIntoConstraints = false
        pickerBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            controlWell.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            controlWell.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            selectedÇolor.bottomAnchor.constraint(equalTo: controlWell.topAnchor, constant: -10),
            selectedÇolor.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            selectColorView.topAnchor.constraint(equalTo: controlWell.bottomAnchor, constant: 20),
            selectColorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            selectColorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            selectColorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            
            pickerBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pickerBtn.bottomAnchor.constraint(equalTo: selectedÇolor.topAnchor, constant: -20),
            pickerBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            pickerBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
    
    @objc func didSelect(color: UIColorWell){
        print(color.selectedColor.debugDescription)
        self.selectColorView.backgroundColor = color.selectedColor

    }
    
    @objc func presentColorPickerViewController(_: Any) {
        
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        
        self.present(colorPickerVC, animated: true, completion: nil)
        
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        print("did Select Color: \(viewController.selectedColor.description)")
        self.pickerBtn.backgroundColor = viewController.selectedColor
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("did Finish: \(viewController.selectedColor.description)")
        self.pickerBtn.backgroundColor = viewController.selectedColor
    }



}


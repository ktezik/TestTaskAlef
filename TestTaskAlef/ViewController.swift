//
//  ViewController.swift
//  TestTaskAlef
//
//  Created by Иван Гришин on 28.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainNameLabel: UITextField!
    @IBOutlet var mainAgeLabel: UITextField!
    
    
    //First children
    @IBOutlet var nameLabelFirstChildren: UILabel!
    @IBOutlet var nameOfFirstChildren: UITextField!
    @IBOutlet var ageOfFirstChildren: UITextField!
    @IBOutlet var ageLabelOfFirstChildren: UILabel!
    @IBOutlet var deleteButtonLabelOne: UIButton!
    
    
    
    //Second children
    @IBOutlet var nameOfSecondChildren: UITextField!
    @IBOutlet var nameLabelOfSecondChildren: UILabel!
    @IBOutlet var wandView: UIView!
    @IBOutlet var ageOfSecondChildren: UITextField!
    @IBOutlet var labelSecondChildren: UILabel!
    @IBOutlet var deleteButtonLabelTwo: UIButton!
    
    
    
    // Add Children
    @IBOutlet var buttonBackgroundOne: UIView!
    @IBOutlet var buttonBackgroundTwo: UIView!
    @IBOutlet var addChildrenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstChildren(isHidden: true)
        secondChildren(isHidden: true)
    }

    //MARK: - IBActions
    @IBAction func addChildrenAction() {
        if nameLabelFirstChildren?.isHidden == true {
            firstChildren(isHidden: false)
        } else {
            secondChildren(isHidden: false)
        }
        if nameLabelFirstChildren?.isHidden == false && nameLabelOfSecondChildren?.isHidden == false {
            addButton(isHidden: true)
        }
    }
    @IBAction func clearViewAction() {
        alert()
    }
    @IBAction func deleteButtonOfFirstChildren() {
        if nameOfSecondChildren.isHidden == true {
            firstChildren(isHidden: true)
        } else {
            nameOfFirstChildren.text = nameOfSecondChildren.text
            ageOfFirstChildren.text = ageOfSecondChildren.text
            nameOfSecondChildren.text = ""
            ageOfSecondChildren.text = ""
            secondChildren(isHidden: true)
            firstChildren(isHidden: false)
        }
        addButton(isHidden: false)
    }
    @IBAction func deleteButtonOfSecondChildren() {
        secondChildren(isHidden: true)
        nameOfSecondChildren.text = ""
        ageOfSecondChildren.text = ""
        addButton(isHidden: false)
    }
    
    //MARK: - PrivateMethods
    
    private func firstChildren(isHidden: Bool) {
        nameLabelFirstChildren?.isHidden = isHidden
        nameOfFirstChildren?.isHidden = isHidden
        ageOfFirstChildren?.isHidden = isHidden
        ageLabelOfFirstChildren?.isHidden = isHidden
        deleteButtonLabelOne?.isHidden = isHidden
    }
    private func secondChildren(isHidden: Bool) {
        nameOfSecondChildren?.isHidden = isHidden
        nameLabelOfSecondChildren?.isHidden = isHidden
        wandView?.isHidden = isHidden
        ageOfSecondChildren?.isHidden = isHidden
        labelSecondChildren?.isHidden = isHidden
        deleteButtonLabelTwo?.isHidden = isHidden
    }
    private func addButton(isHidden: Bool) {
        buttonBackgroundOne?.isHidden = isHidden
        buttonBackgroundTwo?.isHidden = isHidden
        addChildrenButton?.isHidden = isHidden
    }
    private func alert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .default) { _ in
            self.firstChildren(isHidden: true)
            self.secondChildren(isHidden: true)
            self.nameOfSecondChildren.text = ""
            self.ageOfSecondChildren.text = ""
            self.nameOfFirstChildren.text = ""
            self.ageOfFirstChildren.text = ""
            self.mainAgeLabel.text = ""
            self.mainNameLabel.text = ""
            self.addButton(isHidden: false)
        })
        alert.addAction(UIAlertAction(title: "Отмена", style: .destructive))
        
        present(alert, animated: true)
    }
    
}


//
//  ViewController.swift
//  Project-6B-Auto-Layout-Programatic
//
//  Created by verebes on 18/06/2018.
//  Copyright © 2018 A&D Progress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label1: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.text = "THESE"
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        label.text = "ARE"
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.text = "SOME"
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        label.text = "AWESOME"
        return label
    }()

    let label5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.text = "LABELS"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubViews()
        //setConstraintsVFL()
        setConstraintsUsingAutolayoutAnchors()

    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func addSubViews(){
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
    }
    
    func setConstraintsVFL(){
        let viewsDictionary = ["label1":label1, "label2":label2, "label3":label3, "label4":label4, "label5":label5]
        let metrics = ["labelHeight": 88]
        
        for label in viewsDictionary.keys {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
        }
        //by default the - has 10 points space between items but you can make it zero -0- or 30 by -30-
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
    }
    
    func setConstraintsUsingAutolayoutAnchors() {
        var previous: UILabel!
        
        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            if previous != nil {
                //we have a previous label - create a height constraint
                label.topAnchor.constraint(equalTo: previous.bottomAnchor).isActive = true
            }
            
        //set the previous label to be the current one, for the next loop iteration
            previous = label
        }
    }



}


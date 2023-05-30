//
//  FirstViewController.swift
//  ToDo Reminder App
//
//  Created by Arohi, Agnivesh (Contractor) on 11/05/23.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imgV: UIImageView!
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var detailsTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgV.image = UIImage(named: "firstImage")
        titleL.text="Manage and prioritize your tasks easily"
    }


    @IBAction func getStartB(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "viewcontroller") as! ViewController
        show(vc, sender: self)
        
    }
    @IBAction func selectionChanged(_ sender: UISegmentedControl) {
        print("Selection Changed to \(sender.selectedSegmentIndex)")
        if sender.selectedSegmentIndex == 0 {
            imgV.image=UIImage(named:"firstImage")
            titleL.text="Manage and prioritize your tasks easily"
            detailsTV.text="Increase your productivity by managing your personal and team task and do them based on the highest priority!"
        }
        else if sender.selectedSegmentIndex == 1{
            titleL.text="Manage your daily tasks with must list"
            detailsTV.text="By making a to do list, you will know the priorities you want to work on, so that you will be more structured in doing your work!"
            imgV.image = UIImage(named:"images-2")
        }
        else if sender.selectedSegmentIndex == 2{
            titleL.text="Start enjoying a more organized worklife"
            detailsTV.text="Start changing the timeline of life regularly in order to increase your productivity!"
            imgV.image = UIImage(named:"images-3")
        }
    }

}

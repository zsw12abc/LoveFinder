//
//  ViewController.swift
//  LoveFinder
//
//  Created by Shaowei Zhang on 15/7/3.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!

    @IBOutlet weak var heightNumber: UISlider!
    
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //绑定默认的 delegate 到我们自己写的
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func heightChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        //浮点值转换成整数 然后再转化为浮点型 因为 height.text是浮点型
        let i = Int(slider.value)
        slider.value = Float(i)
        height.text = "\(i)厘米"
        
    }

    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅" : "白富美"
        //gregorian 西方历法(公历) 还有农历可以调用
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        //得到现在的日期
        let now = NSDate()
        //NSCalendarUnit.YearCalendarUnit 在 swift2.0 中被替换为 NSCalendarUnit.Year
        let components = gregorian?.components(NSCalendarUnit.Year, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(rawValue: 0))
        let age = components!.year
        
        let hasPropertyText = hasProperty.on ? "有房" : "没房"
        //因为 name.text 和 height.text 是 Optional(可选型) 所以需要加!
        result.text = "\(name.text!), \(age)岁, \(genderText), 身高\(height.text!), \(hasPropertyText), 求交往"
    }
    
    //UITextFiledDeleate 重写 UITextFieldDelegate的申明 点键盘上的下一项后隐藏键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


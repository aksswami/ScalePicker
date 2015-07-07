//
//  ViewController.swift
//  ScalePicker
//
//  Created by Amit kumar Swami on 07/07/15.
//  Copyright (c) 2015 Aks. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    let pickerData = ["Mozzarella","Gorgonzola","Provolone","Brie","Maytag Blue","Sharp Cheddar","Monterrey Jack","Stilton","Gouda","Goat Cheese", "Asiago"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = "\(row)"
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName: UIFont(name: "Georgia", size: 15.0)!, NSForegroundColorAttributeName: UIColor.blueColor()])
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
    
        var view:UIView = UIView()
        view.frame = CGRectMake(0, 0, self.myPicker.frame.width, self.myPicker.frame.height)
        view.backgroundColor = UIColor.whiteColor()
        var subview:UIView = UIView()
        let frame:CGRect = view.frame
        var width = frame.width * 0.5
        var x = frame.width * 0.5
        if row % 5 != 0{
            width = width * 0.5
            x += width
        }
        else {
            var label:UILabel = UILabel()
            label.frame = CGRectMake(frame.width * 0.5 - 40, frame.height * 0.5 - 10, 40, 20)
            label.text = "\(row)"
            view .addSubview(label)
            label.textAlignment = .Left
        }
        subview.frame = CGRectMake(x, frame.height * 0.5 - 5, width, 10)
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: subview.bounds, byRoundingCorners: .TopLeft | .BottomLeft, cornerRadii: CGSize(width: 10.0, height: 10.0)).CGPath
        subview.layer.mask = maskLayer
        subview.backgroundColor = UIColor.greenColor()
        view .addSubview(subview)
        return view
    }

}


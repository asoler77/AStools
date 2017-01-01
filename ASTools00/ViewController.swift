//
//  ViewController.swift
//  StrutsProblems
//
//  Created by soler on 22/12/16.
//  Copyright © 2016 Soler Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//class ViewController: UIViewController {

    @IBOutlet weak var readtextoutlet: UITextField! // entrada de VSWR

    @IBOutlet weak var readtextoutlet2: UITextField! // entrada de RL
    
    @IBOutlet weak var calcoutlet: UILabel! // Resultat de VSWR->RL

    @IBOutlet weak var calcoutlet2: UILabel! // Resultat de RL->VSWR
    
    @IBAction func actioncalc(_ sender: Any) { // Botó conversió VSWR->RL
        var readfloat = Float(readtextoutlet.text!)
        if readfloat != nil{
            readfloat = -20*log((readfloat!-1)/(readfloat!+1))/log(10)
            let resfloatstring = NSString(format: "%.1f", readfloat!)
            calcoutlet.text = resfloatstring as String + " dB"
        }
    }
    
    @IBAction func actioncalc2(_ sender: Any) { // Botó conversió RL->VSWR
        var readfloat = Float(readtextoutlet2.text!)
        if readfloat != nil{
            readfloat = pow(10,(readfloat!/20))
            readfloat = (readfloat!+1)/(readfloat!-1)
            let resfloatstring = NSString(format: "%.2f", readfloat!)
            calcoutlet2.text = (resfloatstring as String)+":1"
        }
    }

    @IBOutlet weak var picker: UIPickerView! // Selector canals DAB
    
    @IBOutlet weak var dabchannelread: UILabel! // Resultat freq canal DAB
    
    var dabchannels: [String] = [String]()
    var dabfrequencies: [String] = [String]()
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dabchannels.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dabchannels[row]
    }
    
    // Quan es selecciona el picker.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        dabchannelread.text = "\(dabfrequencies[row])" + " MHz"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
        self.picker.dataSource = self
        dabchannels = ["5A","5B","5C","5D","6A","6B","6C","6D","7A","7B","7C","7D","8A","8B","8C","8D","9A","9B","9C","9D","10A","10B","10C","10D","11A","11B","11C","11D","12A","12B","12C","12D","13A","13B","13C","13D","13E","13F"]
        dabfrequencies = ["174.928","176.640","178.352","180.064","181.936","183.648","185.360","187.072","188.928","190.640","192.352","194.064","195.936","197.648","199.360","201.072","202.928","204.640","206.352","208.064","209.936","211.648","213.360","215.072","216.928","218.640","220.352","222.064","223.936","225.648","227.360","229.072","230.748","232.496","234.208","235.776","237.448","239.200"]
        picker.selectRow(29, inComponent: 0, animated: true)
        dabchannelread.text = "\(dabfrequencies[picker.selectedRow(inComponent: 0)])" + " MHz"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


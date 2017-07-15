//
//  vpd_vocabsetController.swift
//  Simple Chinese
//
//  Created by Tian Qiu on 7/14/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class vpd_vocabsetController: UIViewController {

    @IBOutlet weak var vps_display: UILabel!
    @IBOutlet weak var vps_slider: UISlider!
    var vps=25
    
    @IBAction func vps_slider_slide(_ sender: Any){
        vps = Int(vps_slider.value)
        vps_display.text="\(vps) words per session"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        UserDefaults.standard.set(vps, forKey: "vps")
        UserDefaults.standard.set(true, forKey: "VocabDefined")
        UserDefaults.standard.set(false, forKey: "DoneStudying")
        UserDefaults.standard.set(0, forKey: "ArrayProgress")
}
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

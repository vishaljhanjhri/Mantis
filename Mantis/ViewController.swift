//
//  ViewController.swift
//  Mantis
//
//  Created by Echo on 10/19/18.
//  Copyright © 2018 Echo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CropViewControllerProtocal {
    let image = UIImage(named: "sunflower.jpg")
    
    func didGetCroppedImage(image: UIImage) {
        croppedImageView.image = image
    }
    
    @IBOutlet weak var croppedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        croppedImageView.image = image
    }
    
    @objc func tapButton1() {
        print("tap button1")
    }
    
    @objc func tapButton2() {
        print("tap button2")
    }
    
    @objc func tapButton3() {
        print("tap button3")
    }
    
    @IBAction func normalPresent(_ sender: Any) {
        guard let image = image else {
            return
        }
        let cropViewController = Mantis.buildCropViewController(image: image)
        cropViewController.delegate = self
        present(cropViewController, animated: true)
    }
    
    @IBAction func embeddedPresent(_ sender: Any) {
        guard let image = image else {
            return
        }
        let cropViewController = Mantis.buildCropViewController(image: image, mode: .embedded)
        cropViewController.delegate = self
        
        let button1 = UIButton(type: .infoLight)
        cropViewController.add(button: button1)
        button1.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        
        let button2 = UIButton(type: .contactAdd)
        cropViewController.add(button: button2)
        button2.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        
        let button3 = UIButton(type: .infoDark)
        cropViewController.add(button: button3)
        button3.addTarget(self, action: #selector(tapButton3), for: .touchUpInside)
        
        present(cropViewController, animated: true)
    }
}

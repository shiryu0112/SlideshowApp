//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 高橋子竜 on 2021/07/06.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var expansionImage: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let result = image
        expansionImage.image = result
    }
}


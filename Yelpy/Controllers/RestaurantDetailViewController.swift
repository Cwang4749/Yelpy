//
//  RestaurantDetailViewController.swift
//  Yelpy
//
//  Created by JC on 3/9/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restImage: UIImageView!
    
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restImage.af_setImage(withURL: r.imageURL!)

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

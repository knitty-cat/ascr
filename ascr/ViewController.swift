//
//  ViewController.swift
//  ascr
//
//  Created by alex on 05.06.19.
//  Copyright © 2019 alex. All rights reserved.
//

import UIKit
import CoreLocation
import ARCL

class ViewController: UIViewController {

    var sceneLocationView = SceneLocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneLocationView.run()
        self.view.addSubview(sceneLocationView)
        
        let coordinate = CLLocationCoordinate2D(latitude: 51.504571, longitude: -0.019717)
        let location = CLLocation(coordinate: coordinate, altitude: 10)
        let image = UIImage(named: "pin")!
        let annotationNode = LocationAnnotationNode(location: location, image: image)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneLocationView.frame = view.bounds
    }


}


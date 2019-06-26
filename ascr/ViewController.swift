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
import ARKit
import Foundation

class ViewController: UIViewController, ARSCNViewDelegate {
    
    struct TrackedImage {
        var name : String
        var node : SCNNode?
    }
    
    var sceneLocationView = SceneLocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneLocationView.run()
        sceneLocationView.delegate = self
        self.view.addSubview(sceneLocationView)
        
        let coordinate = CLLocationCoordinate2D(latitude: 53.0809, longitude: 8.7962)
        let location = CLLocation(coordinate: coordinate, altitude: 0)
        let image = UIImage(named: "balken")!
        let annotationNode = LocationAnnotationNode(location: location, image: image)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sceneLocationView.frame = view.bounds
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // Check if the added anchor is a recognized ARImageAnchor
        if let imageAnchor = anchor as? ARImageAnchor{
            print("add")
            // Get the reference ar image
            let referenceImage = imageAnchor.referenceImage
            // Create a plane to match the detected image.
            let plane = SCNPlane(width: referenceImage.physicalSize.width, height: referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor(red: 1, green: 0.1, blue: 1, alpha: 0.5)
            // Create SCNNode from the plane
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            // Add the plane to the scene.
            node.addChildNode(planeNode)
            // Add the node to the tracked images
        }
    }
}


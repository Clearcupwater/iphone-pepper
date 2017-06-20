//
//  File.swift
//  WorldTrotter
//
//  Created by Tadmin on 6/19/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
    
        let segmentedControl = UISegmentedControl(items: ["Satellite","Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trainingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trainingConstraint.isActive = true
        
    }
    

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("MapView Controller loaded its view")
    }
    
}

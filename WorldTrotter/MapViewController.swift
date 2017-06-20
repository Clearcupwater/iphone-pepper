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
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo:topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trainingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        segmentedControl.addTarget(self, action: #selector(self.mapTypeChanged(_:)), for: .valueChanged)
    
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trainingConstraint.isActive = true
        
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("MapView Controller loaded its view")
    }
    
}

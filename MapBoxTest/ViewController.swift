//
//  ViewController.swift
//  MapBoxTest
//
//  Created by David Brunow on 11/4/15.
//  Copyright © 2015 Shepherd Dog. All rights reserved.
//

import GoogleMaps
import Mapbox
import MapKit
import UIKit

class ViewController: UIViewController
{
    var appleMap:   MKMapView!
    var mapBoxMap:  MGLMapView!
    var googleMap:  GMSMapView!
    
    enum MapBrand
    {
        case Apple
        case Google
        case MapBox
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let mapBrand = MapBrand.Google
        
        switch mapBrand
        {
        case .Apple:
            appleMap = MKMapView(frame: view.bounds)
            appleMap.mapType = .Hybrid
            
            view.addSubview(appleMap)
        case .Google:
            let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
                longitude: 151.20, zoom: 6)
            googleMap = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
            googleMap.myLocationEnabled = true
            googleMap.mapType = kGMSTypeHybrid
            
            self.view = googleMap
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
            marker.title = "Sydney"
            marker.snippet = "Australia"
            marker.map = googleMap
        case .MapBox:
            let styleURL = NSURL(string: "asset://styles/satellite-v8.json")
            
            mapBoxMap = MGLMapView(frame: view.bounds, styleURL: styleURL)
            
            view.addSubview(mapBoxMap)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


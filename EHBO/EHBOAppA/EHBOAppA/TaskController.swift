//
//  TaskController.swift
//  AHBO
//
//  Created by Fhict on 21/04/16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit
import MapKit

class TaskController: UIViewController {

    var wissel: Int32?
    var lat: Double?
    var lon: Double?
    
    @IBOutlet weak var lblInformatie: UILabel!
    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var mapView: MKMapView!
    
    //Als data ingeladen wordt en de kaart wordt geïnitialiseerd
    override func viewDidLoad(){
        super.viewDidLoad()
        if wissel == 1 {
            lblInformatie.text = "Ga naar de plek van het ongeval. Zie het kaartje beneden voor de kortste route."
            titleBar.title = "Reanimeren"
        } else if wissel == 2 {
            lblInformatie.text = "Breng het EHBO kistje naar de plek van het ongeval. Zie het kaartje beneden voor de kortste route."
            titleBar.title = "EHBO kist"
        } else if wissel == 3 {
            lblInformatie.text = "Breng de AED naar de plek van het ongeval. Zie het kaartje beneden voor de kortste route."
            titleBar.title = "AED"
        }
        
        let request = MKDirectionsRequest()
        if(mapView.userLocation.coordinate.latitude > 0 && mapView.userLocation.coordinate.longitude > 0){
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.userLocation.coordinate, addressDictionary: nil))
        }
        else{
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D( latitude: 51.451434, longitude: 5.482777), addressDictionary: nil))
        }
        
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat!, longitude: lon!), addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .Walking
        
        let directions = MKDirections(request: request)
        
        directions.calculateDirectionsWithCompletionHandler{
            [unowned self] response, error in guard let unwrappedResponse = response else { return }
            
            for route in unwrappedResponse.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
        
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!, lon!)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = "Locatie van ongeval"
        self.mapView.addAnnotation(objectAnnotation)
    }

    //sommige dingen van mapview in beeld zetten
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.lineWidth = 3
        renderer.strokeColor = UIColor.blueColor()
        return renderer
    }
    
}
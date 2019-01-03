//
//  MapTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/9/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell, NibReusable, CLLocationManagerDelegate, MKMapViewDelegate {
    var locationManager: CLLocationManager = CLLocationManager()

    @IBOutlet var placeName: UILabel!
    @IBOutlet var mapView: MKMapView!
    weak var item: ItemModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        guard let placeName = item?.place else {
            return
        }
        self.placeName.text = placeName

        guard let coordinate = item?.placeCoodinate else {
            return
        }
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        addRadiusCircle(location: location)
    }
    
    func addRadiusCircle(location: CLLocation){
        self.mapView.delegate = self
        let circle = MKCircle(center: location.coordinate, radius: 300)
        self.mapView.add(circle)
    }
    
   
    
    func mapView(_ mapView: MKMapView!, rendererFor overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKCircle {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.red
            circle.fillColor = UIColor.clear
            circle.lineWidth = 1
            return circle
        } else {
            return nil
        }
    }
    
    static var reuseIdentifier: String { return "MapTableViewCell" }
    static var nib: UINib { return UINib(nibName: "MapTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct MapTableViewCellModel {
    var item: ItemModel?
}

extension MapTableViewCellModel: CellViewModel {
    func setup(cell: MapTableViewCell) {
        cell.item = item
    }
}

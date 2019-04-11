//
//  MKMapView.swift
//  ASCommon
//
//  Created by Andrea Stevanato on 27/08/2018.
//

import Foundation
import MapKit

public extension MKMapView {

    /// Set map region
    ///
    /// - Parameters:
    ///   - coordinate: The coordinate
    ///   - span: The span
    ///   - animated: Animated
    func setRegion(coordinate: CLLocationCoordinate2D, span: CLLocationDistance = 3000, animated: Bool = true) {
        let region = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: span, longitudinalMeters: span)
        self.setRegion(region, animated: animated)
    }

    func moveCenterByOffSet(offSet: CGPoint, coordinate: CLLocationCoordinate2D) {
        var point = self.convert(coordinate, toPointTo: self)

        point.x += offSet.x
        point.y += offSet.y

        let center = self.convert(point, toCoordinateFrom: self)
        self.setCenter(center, animated: true)
    }

    func centerCoordinateByOffSet(offSet: CGPoint) -> CLLocationCoordinate2D {
        var point = self.center

        point.x += offSet.x
        point.y += offSet.y

        return self.convert(point, toCoordinateFrom: self)
    }

    /// Get the first map annotation (current user location excluded)
    ///
    /// - Returns: An annotation if available
    func getFirstAnnotation() -> MKAnnotation? {
        for annotation in self.annotations where !(annotation is MKUserLocation) {
            return annotation
        }
        return nil
    }
}

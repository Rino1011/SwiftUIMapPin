import SwiftUI
import MapKit

struct PlaceModel: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

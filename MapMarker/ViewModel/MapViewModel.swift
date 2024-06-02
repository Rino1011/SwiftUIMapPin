import SwiftUI
import MapKit

class MapViewModel: ObservableObject {
    @Published var markers: [PlaceModel] = []
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    func addMarker(latitude: Double, longitude: Double) {
        let newMarker = PlaceModel(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        markers.append(newMarker)
        region.center = newMarker.coordinate // 新しいマーカーを追加した位置に中心を移動
    }
}

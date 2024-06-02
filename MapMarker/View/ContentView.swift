import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var showingInputView = false

    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.markers) { marker in
                MapMarker(coordinate: marker.coordinate, tint: .red)
            }
            .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Button(action: {
                    showingInputView = true
                }) {
                    Text("マーカーを追加")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .sheet(isPresented: $showingInputView) {
                    InputView(onAdd: { latitude, longitude in
                        viewModel.addMarker(latitude: latitude, longitude: longitude)
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct InputView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var latitude: String = ""
    @State private var longitude: String = ""

    var onAdd: (Double, Double) -> Void

    var body: some View {
        VStack {
            TextField("緯度", text: $latitude)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)

            TextField("経度", text: $longitude)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)

            Button(action: {
                if let lat = Double(latitude), let lon = Double(longitude) {
                    onAdd(lat, lon)
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("追加")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}

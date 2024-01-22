import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var useFrontCamera = true
    @State private var isVolumeOn = true

    var body: some View {
        ZStack {
            Color(red: 0.31, green: 0.60, blue: 0.51).edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // "Back" button at the top
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                            Text("Back")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding()

                Spacer()

                // Settings title
                Text("Settings")
                    .font(Font.custom("JejuHallasan", size: 48))
                    .foregroundColor(.white)

                // Camera selection button
                Button(action: {
                    self.useFrontCamera.toggle()
                }) {
                    Text(useFrontCamera ? "Front Camera" : "Back Camera")
                        .font(Font.custom("JejuHallasan", size: 32))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Volume control button
                Button(action: {
                    self.isVolumeOn.toggle()
                }) {
                    Text(isVolumeOn ? "Volume On" : "Volume Off")
                        .font(Font.custom("JejuHallasan", size: 32))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

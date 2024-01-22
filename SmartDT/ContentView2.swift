import SwiftUI

// Ensure you have SettingsViewModel defined in your project.
// If not, please define it as shown previously.

struct ContentView: View {
    @StateObject var settings = SettingsViewModel() // Owns the instance of the SettingsViewModel
    @State private var isShowingGameSetupView = false
    @State private var isShowingSettingsView = false

    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.31, green: 0.6, blue: 0.51).edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // App title
                Text("Smart Dart")
                    .font(Font.custom("JejuHallasan", size: 60))
                    .foregroundColor(.white)
                    .padding(.top, 100)

                // Dartboard image placeholder
                Image("dartboard") // Replace "dartboard" with your actual image asset name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .cornerRadius(100)
                    .padding(.top, 50)

                // Start Game button
                Button("Start Game") {
                    isShowingGameSetupView = true
                }
                .font(Font.custom("JejuHallasan", size: 32))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(25)
                .shadow(radius: 5)
                .padding(.horizontal)
                .padding(.bottom, 20)
                .fullScreenCover(isPresented: $isShowingGameSetupView) {
                    GameSetupView().environmentObject(settings)
                }

                // Settings button
                Button("Settings") {
                    isShowingSettingsView = true
                }
                .font(Font.custom("JejuHallasan", size: 32))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(25)
                .shadow(radius: 5)
                .padding(.horizontal)
                .fullScreenCover(isPresented: $isShowingSettingsView) {
                    SettingsView().environmentObject(settings)
                }

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingsViewModel())
    }
}

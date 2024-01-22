// GameSetupView.swift
import SwiftUI

struct GameSetupView: View {
    @EnvironmentObject var settings: SettingsViewModel
    @State private var playerOneName: String = ""
    @State private var playerTwoName: String = ""
    @State private var rounds: String = ""
    @State private var isCameraPresented = false
    @State private var capturedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color(red: 0.31, green: 0.60, blue: 0.51).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Back button at the top
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding()

                Spacer()

                TextField("Player 1", text: $playerOneName)
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)

                                TextField("Player 2", text: $playerTwoName)
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)

                                TextField("Rounds", text: $rounds)
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)

                Button("Go!") {
                    isCameraPresented = true
                }
                .font(Font.custom("JejuHallasan", size: 32))
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                .shadow(radius: 4)

                Spacer()
            }
        }
        .sheet(isPresented: $isCameraPresented) {
            CameraView(isShown: $isCameraPresented, image: $capturedImage, useFrontCamera: settings.useFrontCamera)
        }
    }
}

struct GameSetupView_Previews: PreviewProvider {
    static var previews: some View {
        GameSetupView().environmentObject(SettingsViewModel())
    }
}

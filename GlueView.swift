import SwiftUI

struct GlueView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isAboutViewPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                isAboutViewPresented = true
            }) {
                Text("Что вас ждет?")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 57)
            .background(Color(hex: "12EBCB"))
            .cornerRadius(28)
           
            
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 27)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Button(action: {
                dismiss()
            }) {
                VStack {
                    Image("glue-bg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 573, height: 576)
                    Spacer()
                }
            }
        )
        .background(
            RadialGradient(
                gradient: Gradient(colors: [
                    Color(hex: "FFA6C1"),
                    Color(hex: "FF6A60")
                ]),
                center: .bottom,
                startRadius: 20,
                endRadius: 500
            )
        )
        .fullScreenCover(isPresented: $isAboutViewPresented) {
            AboutView()
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    GlueView()
}

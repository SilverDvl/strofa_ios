import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            VStack {
                HStack {
                    Image("about-header")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 267, height: 206)
                    Spacer()
                }
                Spacer()
                HStack {
                    Image("about-footer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 267, height: 206)
                    Spacer()
                }
            }
            .padding(.horizontal, 27)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("about-bg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1060, height: 633)
            )
            .background(Color(.systemGray6))
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    AboutView()
}

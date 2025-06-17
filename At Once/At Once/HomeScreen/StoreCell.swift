import SwiftUI

struct StoreCell: View {
    var storeName: String = "My Store"
    var storeAddress: String = "Store Address"
    var mini: Int = 700

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(.icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.trailing, 12)

                VStack(alignment: .leading, spacing: 6) {
                    Text(storeName)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text(storeAddress)
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text("Minimum: \(mini) EGP")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("Delivery Daily")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.customBackground)) 
        )
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    Group {
        StoreCell()
            .padding()
            .background(Color(.systemGroupedBackground))
            .previewDisplayName("Light Mode")

        StoreCell()
            .padding()
            .background(Color(.systemGroupedBackground))
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
    }
}

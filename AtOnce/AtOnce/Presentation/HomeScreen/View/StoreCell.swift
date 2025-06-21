import SwiftUI

struct StoreCell: View {
    
    var warehouse: Warehouse
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                
                AsyncImage(
                    url: URL(string: warehouse.imageUrl)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.trailing, 12)
                    case .failure:
                        Image(systemName: "person.fill.questionmark")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.trailing, 12)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(warehouse.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(warehouse.address)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(String(
                        format: NSLocalizedString("minimum_order_format", comment: ""),
                        warehouse.minimumPrice.localizedDigits
                    ))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Text(warehouse.delivaryRate)
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
        StoreCell(warehouse: Warehouse(id: 1, name: "eman", address: "alex", imageUrl: "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg", minimumPrice: 400, delivaryRate: "Daily", governate: "alex"))
            .padding()
            .background(Color(.systemGroupedBackground))
        
        
    }
}

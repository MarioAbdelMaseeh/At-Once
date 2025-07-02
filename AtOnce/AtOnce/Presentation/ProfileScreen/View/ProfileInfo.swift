//
//  ProfileInfo.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//
import SwiftUI

struct ProfileInfo: View {
    
    let pharmacy: CachedPharmacy
    @EnvironmentObject var coordinator: AppCoordinator
    
//    init(pharmacy: CachedPharmacy) {
//        self.pharmacy = pharmacy
//    }
    
    init(pharmacy: CachedPharmacy) {
        self.pharmacy = pharmacy
    }
    var body: some View {
        
        
        ZStack(alignment: .top) {
            Color.primaryTeal
                .edgesIgnoringSafeArea(.all)
            
//            VStack {
//                // Top bar
//                //                HStack {
//                //                    Button(action: {
//                //                        // handle back
//                //                    }) {
//                //                        Image(systemName: "chevron.left")
//                //                            .font(.title2)
//                //                            .foregroundColor(.white)
//                //                    }
//                //                    Spacer()
//                //                    Text("My Profile")
//                //                        .font(.title2)
//                //                        .fontWeight(.semibold)
//                //                        .foregroundColor(.white)
//                //                    Spacer()
//                //                    // spacer to balance the back button
//                //                    Spacer().frame(width: 24)
//                //                }
//                //                .padding(.horizontal)
//                //                .padding(.top, 50)
//                
//                Spacer()
//            }
            
            VStack {
                Spacer().frame(height: 150) // push the card down
                
               
                VStack(spacing: 24) {
                    Spacer().frame(height: 50) // leave space for image
                    
                    Text(pharmacy.name)
                        .font(.headline)
                        .foregroundColor(.primaryTeal)
                    
                    profileRow(icon: "envelope.fill", text: pharmacy.email)
                    profileRow(icon: "phone.fill", text: pharmacy.phone)
                    profileRow(icon: "house.fill", text: pharmacy.name)
                    profileRow(icon: "mappin.and.ellipse", text: pharmacy.governate)
                    profileRow(icon: "mappin.and.ellipse", text: pharmacy.address)
                    
                    Spacer()
                }
               // .padding()
                .frame(/*width: 350,*/ height: 450)
                .background(Color(.customBackground))
                .cornerRadius(20)
               .padding(.horizontal)
            }.padding(.horizontal)
            
            VStack {
                Spacer().frame(height: 90)
                
                ZStack {
                    // Circle with stroke and background
                    Circle()
                        .fill(Color.white.opacity(0.3))
                        .frame(width: 120, height: 120) // Slightly larger than image
                        .overlay(
                            Circle().stroke(Color.primaryTeal, lineWidth: 5)
                        )
                        //.shadow(radius: 5)
                    
                    // Image inside the circle with padding
                    Image(.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100) // Slightly smaller than the outer circle
                        .clipShape(Circle())
                }
            }

            
        
//            VStack {
//                Spacer().frame(height: 90)
//                Image(.profile)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 120, height: 120)
//                    .clipShape(Circle())
//                    .overlay(
//                        Circle()
//                            .stroke(Color.primaryTeal, lineWidth: 5)
//                    )
//                    .background(Circle().fill(Color.white.opacity(0.3)))
//                    .shadow(radius: 5)
//            }
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Profile Info".localized)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        coordinator.mainPath.removeLast()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text(NSLocalizedString("back", comment: ""))
                        }
                    }
                }
            
        }
        
        
        
    }
    
    @ViewBuilder
    func profileRow(icon: String, text: String) -> some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.primaryTeal.opacity(0.2))
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(.primaryTeal)
            }
            
            Text(text)
                .foregroundColor(.primary)
                .font(.body)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}






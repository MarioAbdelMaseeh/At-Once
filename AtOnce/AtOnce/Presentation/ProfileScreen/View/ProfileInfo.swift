//
//  ProfileInfo.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//
import SwiftUI

struct ProfileInfo: View {
    
    var pharmacy: CachedPharmacy
    var body: some View {
        
        
        ZStack(alignment: .top) {
            Color.primaryTeal
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Top bar
                //                HStack {
                //                    Button(action: {
                //                        // handle back
                //                    }) {
                //                        Image(systemName: "chevron.left")
                //                            .font(.title2)
                //                            .foregroundColor(.white)
                //                    }
                //                    Spacer()
                //                    Text("My Profile")
                //                        .font(.title2)
                //                        .fontWeight(.semibold)
                //                        .foregroundColor(.white)
                //                    Spacer()
                //                    // spacer to balance the back button
                //                    Spacer().frame(width: 24)
                //                }
                //                .padding(.horizontal)
                //                .padding(.top, 50)
                
                Spacer()
            }
            
            VStack {
                Spacer().frame(height: 120) // push the card down
                
                // White card with info
                VStack(spacing: 24) {
                    Spacer().frame(height: 70) // leave space for image
                    
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
                .padding()
                .frame(/*width: 350,*/ height: 500)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }.padding(.horizontal)
            //.padding(.bottom,50)//.frame(height: 150)
            
            // Avatar image in circle, overlapping card
            VStack {
                Spacer().frame(height: 90)
                Image(.icon) // Add to Assets
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.primaryTeal, lineWidth: 5)
                    )
                    .background(Circle().fill(Color.white))
                    .shadow(radius: 5)
            }
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Profile Info")
                    .font(.title)
                    .fontWeight(.semibold)
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
                .foregroundColor(.black)
                .font(.body)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}




//struct ProfileInfo: View {
//    var body: some View {
//        VStack(spacing: 16) {
//            // Top bar
//            HStack {
//                Button(action: {
//                    // Handle back action
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                }
//                Spacer()
//                Text("My Profile")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                Spacer()
//                // Empty space to balance the back button
//                Spacer().frame(width: 24)
//            }
//            .padding()
//
//            // Profile Image and Username
//            VStack(spacing: 8) {
//                Image("profile_avatar") // Make sure this matches the asset name
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 120, height: 120)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 4))
//                    .shadow(radius: 4)
//
//                Text("z3tot")
//                    .font(.title3)
//                    .fontWeight(.medium)
//                    .foregroundColor(.white)
//            }
//            .padding(.bottom)
//
//            // Info Card
//            VStack(alignment: .leading, spacing: 20) {
//                profileRow(icon: "envelope.fill", text: "z3tot@z3ateto.com")
//                profileRow(icon: "phone.fill", text: "012222222222")
//                profileRow(icon: "house.fill", text: "za3teto")
//                profileRow(icon: "mappin.and.ellipse", text: "القاهرة")
//                profileRow(icon: "mappin.and.ellipse", text: "z3tot")
//            }
//            .padding()
//            .background(Color.white)
//            .cornerRadius(20)
//            .padding()
//
//            Spacer()
//        }
//        .background(Color.primaryTeal.edgesIgnoringSafeArea(.all))
//    }
//
//    @ViewBuilder
//    func profileRow(icon: String, text: String) -> some View {
//        HStack(spacing: 16) {
//            ZStack {
//                RoundedRectangle(cornerRadius: 8)
//                    .fill(Color.teal.opacity(0.2))
//                    .frame(width: 40, height: 40)
//                Image(systemName: icon)
//                    .foregroundColor(.teal)
//            }
//
//            Text(text)
//                .font(.body)
//                .foregroundColor(.black)
//        }
//    }
//}


//#Preview {
//    ProfileInfo()
//}
















//struct ProfileInfo: View {
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header with gradient and back button
//            ZStack(alignment: .topLeading) {
//                LinearGradient(colors: [.primaryTeal, .primaryTeal.opacity(0.8)],
//                               startPoint: .top,
//                               endPoint: .bottom)
//                   // .frame(height: 240)
//                    .ignoresSafeArea()
//
//                VStack {
//                    HStack {
//                        Button(action: {
//                            // Back action
//                        }) {
//                            Image(systemName: "chevron.left")
//                                .font(.title2)
//                                .foregroundColor(.white)
//                        }
//                        Spacer()
//                        Text("My Profile")
//                            .font(.title3)
//                            .foregroundColor(.white)
//                            .bold()
//                        Spacer()
//                        // Empty to center title
//                        Image(systemName: "chevron.left")
//                            .opacity(0)
//                    }
//                    .padding(.horizontal)
//                    .padding(.top, 50)
//
//                    Spacer()
//
//                    // Profile Image
//                    ZStack {
//                        Circle()
//                            .fill(Color.white)
//                            .frame(width: 100, height: 100)
//                            .shadow(radius: 4)
//
//                        Image(systemName: "person.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.primaryTeal)
//                    }
//                    .offset(y: 60)
////                    ZStack {
////                        Circle()
////                            .fill(Color.white.opacity(0.2))
////                            .frame(width: 120, height: 120)
////                        Circle()
////                            .stroke(Color.white, lineWidth: 4)
////                            .frame(width: 100, height: 100)
////
////                        AsyncImage(url: URL(string: "https://i.imgur.com/your_profile_image.jpg")) { image in
////                            image
////                                .resizable()
////                                .scaledToFill()
////                        } placeholder: {
////                            ProgressView()
////                        }
////                        .clipShape(Circle())
////                        .frame(width: 100, height: 100)
////                    }
////                    .offset(y: 60)
//                }
//            }
//            .frame(height: 160)
//
//            // Profile Info Card
//            VStack(spacing: 16) {
//                Text("Ebrahem Elzainy")
//                    .font(.headline)
//                    .foregroundColor(.primaryTeal)
//
//                ProfileItem(icon: "cross.case.fill", label: "Specialist - Doctor")
//                ProfileItem(icon: "person.fill", label: "Male")
//                ProfileItem(icon: "calendar", label: "29-03-1997")
//                ProfileItem(icon: "mappin.and.ellipse", label: "Mansoura , Shirben")
//                ProfileItem(icon: "heart.fill", label: "Single")
//                ProfileItem(icon: "envelope.fill", label: "ebrahemelzainy@gmail.com")
//                ProfileItem(icon: "phone.fill", label: "096521145523")
//            }
//            .padding()
//            .background(Color.white)
//            .cornerRadius(24)
//            .padding(.top, 80)
//            .padding(.horizontal)
//            .shadow(radius: 5)
//
//            Spacer()
//        }
//        .background(Color.primaryTeal.opacity(0.1).ignoresSafeArea())
//    }
//}
//
//#Preview {
//    ProfileInfo()
//}
//
//struct ProfileItem: View {
//    let icon: String
//    let label: String
//
//    var body: some View {
//        HStack(alignment: .center, spacing: 16) {
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.primaryTeal.opacity(0.15))
//                    .frame(width: 36, height: 36)
//                Image(systemName: icon)
//                    .foregroundColor(.primaryTeal)
//            }
//            Text(label)
//                .font(.body)
//            Spacer()
//        }
//    }
//}

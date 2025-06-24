//
//  ProfileInfo.swift
//  AtOnce
//
//  Created by Iman Mahmoud on 23/06/2025.
//

import SwiftUI

struct ProfileInfo: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header with gradient and back button
            ZStack(alignment: .topLeading) {
                LinearGradient(colors: [.primaryTeal, .primaryTeal.opacity(0.8)],
                               startPoint: .top,
                               endPoint: .bottom)
                   // .frame(height: 240)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Button(action: {
                            // Back action
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Text("My Profile")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        // Empty to center title
                        Image(systemName: "chevron.left")
                            .opacity(0)
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    // Profile Image
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 4)

                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.primaryTeal)
                    }
                    .offset(y: 60)
//                    ZStack {
//                        Circle()
//                            .fill(Color.white.opacity(0.2))
//                            .frame(width: 120, height: 120)
//                        Circle()
//                            .stroke(Color.white, lineWidth: 4)
//                            .frame(width: 100, height: 100)
//
//                        AsyncImage(url: URL(string: "https://i.imgur.com/your_profile_image.jpg")) { image in
//                            image
//                                .resizable()
//                                .scaledToFill()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .clipShape(Circle())
//                        .frame(width: 100, height: 100)
//                    }
//                    .offset(y: 60)
                }
            }
            .frame(height: 160)

            // Profile Info Card
            VStack(spacing: 16) {
                Text("Ebrahem Elzainy")
                    .font(.headline)
                    .foregroundColor(.primaryTeal)

                ProfileItem(icon: "cross.case.fill", label: "Specialist - Doctor")
                ProfileItem(icon: "person.fill", label: "Male")
                ProfileItem(icon: "calendar", label: "29-03-1997")
                ProfileItem(icon: "mappin.and.ellipse", label: "Mansoura , Shirben")
                ProfileItem(icon: "heart.fill", label: "Single")
                ProfileItem(icon: "envelope.fill", label: "ebrahemelzainy@gmail.com")
                ProfileItem(icon: "phone.fill", label: "096521145523")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(24)
            .padding(.top, 80)
            .padding(.horizontal)
            .shadow(radius: 5)

            Spacer()
        }
        .background(Color.primaryTeal.opacity(0.1).ignoresSafeArea())
    }
}

#Preview {
    ProfileInfo()
}

struct ProfileItem: View {
    let icon: String
    let label: String

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primaryTeal.opacity(0.15))
                    .frame(width: 36, height: 36)
                Image(systemName: icon)
                    .foregroundColor(.primaryTeal)
            }
            Text(label)
                .font(.body)
            Spacer()
        }
    }
}

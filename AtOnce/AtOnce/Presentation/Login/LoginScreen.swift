//
//  LoginView.swift
//  At Once
//
//  Created by mac on 16/06/2025.
//


import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel: LoginScreenViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State var showErrorAlert : Bool = false
    @State var ShowSuccessAlert : Bool = false
    @State private var isPasswordVisible = false
    let buttonLabel = NSLocalizedString("login", comment: "")
    
    init() {
        _viewModel = StateObject(wrappedValue: AppDIContainer.shared.container.resolve(LoginScreenViewModelProtocol.self)! as! LoginScreenViewModel)
    }

    var body: some View {
        NavigationStack {
            VStack(/*alignment:.leading ,spacing: 20*/) {
                //Spacer(minLength: 10)

                
                Image(.icon)
                    .resizable()
                    .frame(width: 120,height: 120,alignment: .center)
                   // .shadow(color: .green, radius: 10)
                    .clipShape(.circle)
    //                .padding(.top,40)

                VStack(spacing: 4) {
                    Text("welcome_to")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("at_once_pharma")
                        .font(.title2)
                        .fontWeight(.bold)
                }.padding(.bottom,32)

              
                TextFieldComponent(title: NSLocalizedString("email", comment: ""), text: /*$viewModel.*/$email)
//                    .padding(.bottom, 16)
                if let emailError = viewModel.emailError {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                       // .padding(.bottom, 12)
                }
                                    
                    
                
               
                PasswordFieldComponent(title:NSLocalizedString("password", comment: ""),isPasswordVisible: $isPasswordVisible, password: /*$viewModel.*/$password)
                    .padding(.top,16)
                
                if let passwordError = viewModel.passwordError {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        //.padding(.bottom, 12)
                }
                                    
                

               
                HStack {
                    Spacer()
                    Button("forget_password") {
                        // action
                    }
                    .foregroundColor(.primaryTeal)
                    .bold()
                    .font(.callout)
                }.padding(.bottom, 32)

                
                LargeButtonComponent(label: buttonLabel){
                    viewModel.login(email: email, password: password)
                }

                Spacer().frame(height: 80)

                HStack(spacing: 4) {
                    Text("no_account")
                
                    NavigationLink(destination: RegisterView()) {
                        Text("register_here")
                            .foregroundColor(.primaryTeal)
                            .fontWeight(.semibold)
                    }
                }
                .font(.callout)
                
            
                    
                    
                   
                    
                    
                    
                    
                    
                
            }
            .padding()
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.loginSuccess != nil },
                set: { _ in viewModel.loginSuccess = nil }
            )) {
                if viewModel.loginSuccess == true {
                    return Alert(
                        title: Text("Login Successful"),
                        message: Text("Welcome back!"),
                        dismissButton: .default(Text("OK"))
                    )
                } else {
                    return Alert(
                        title: Text("Login Failed"),
                        message: Text(viewModel.errorMessage ?? "Unknown error"),
                        dismissButton: .default(Text("Ok"))
                    )
                }
            }
                            
        }
        
    }
}

#Preview {
    LoginScreen()
}

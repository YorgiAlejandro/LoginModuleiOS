//
//  ContentView.swift
//  ModulesWithSPM
//
//  Created by Yorgi Del Rio on 10/9/23.
//  Los modulos se usan para agrupar codigo
// Se usan mucho para evitar conflictos entre equipos
// El tiempo de compilacion es mas rapido con modulos
// Es mas facil de categorizar los bugs con modulos
// Menos codigo duplicado
// Los modulos se hacen openSource para que sea utilizado en otras apps

//En esta vista vamos a crear un modulo llamado LoginModule y lo vamos a usar para crear un Login

import SwiftUI


public struct ContentView: View {
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @State var email: String = ""
    @State var password: String = ""
    
    public init () {}
    
    public var body: some View {
        VStack{
            Image("logoYoutube", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(width: 400)
                .padding(.bottom, 30)
            Group{
                HStack{
                    Image(systemName: "envelope.fill")
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                HStack{
                    Image(systemName: "key.fill")
                    SecureField("Contraseña", text: $password)
                }
            }.padding()
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(.black, lineWidth: 1))
                .padding(.horizontal, 40)
            Button("Login"){
                authenticationViewModel.login(email: email, password: password)
            }.buttonStyle(.bordered)
                .tint(.black)
            Text("Suscribete a Yorgi para apoyar el canal")
                .font(.footnote)
                .underline()
                .foregroundStyle(.tertiary)
                .padding(.top, 40)
            Spacer()
        }.alert(authenticationViewModel.loginStatus == .success ? "Login Success" : "Login Failed", isPresented: $authenticationViewModel.didUpdateLoginStatus) {
            Button(authenticationViewModel.loginStatus == .success ? "Aceptar" : "Reintentar") {
                print("Dismiss alert")
            }
            Button("Cancelar"){
                print("Cancelando operacion")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 55, height: 55)
                            .foregroundColor(Color("Primary"))
                            .overlay {
                                Image(systemName: "arrow.backward")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        Spacer()
                    }
                    HStack {
                        Text("VERIFICATION")
                            .font(.custom(
                                "AmericanTypewriter",
                                fixedSize: 34))
                            .bold()
                            .foregroundColor(Color("Primary"))
                        Spacer()
                    }
                    
                    HStack {
                        Text("We have sent you OTP via SMS")
                            .font(.custom(
                                "ArialBlack",
                                fixedSize: 14))
                            .foregroundColor(.white.opacity(0.5))
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                .padding(.bottom,  10)
                .padding(.leading, 20)
                
                
                Image("verification")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, 20)
                
                
                
                OTPTextFieldView(pinLength: 6, keyboardType: .default) { pin in
                    print(pin)
                }
                .padding(.top, 100)
                .padding([.leading, .trailing], 20 )
                
                
                Spacer()
                
                Button {
                    
                } label: {
                    Rectangle()
                        .overlay {
                            Text("CONTINUE")
                                .font(.custom(
                                    "AmericanTypewriter",
                                    fixedSize: 30))
                                .foregroundColor(.black)
                                .bold()
                        }
                        
                }
                .frame(height: 70)
                .foregroundColor(Color("Primary"))

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .padding(.top, 60)
            
        }
        
        .ignoresSafeArea()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

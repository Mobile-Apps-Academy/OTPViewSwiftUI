//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//

import SwiftUI
import Combine

struct OTPTextField: View {
    @FocusState private var keyboardFocusedField: FocusField?
    @Binding var verificationCode: String
    @State var isAllNumbersFilled:Bool = false
    
    var pinLength: Int = 6
    var keyboardType: UIKeyboardType = .numberPad
    var onComplete: () -> ()
    
    var body: some View {
        ZStack {
            TextField("", text: $verificationCode)
                .frame(width: 0, height: 0, alignment: .center)
                .font(Font.system(size: 0))
                .accentColor(Color("Primary"))
                .foregroundColor(Color("Primary"))
                .multilineTextAlignment(.center)
                .keyboardType(keyboardType)
                .focused($keyboardFocusedField, equals: .field)
                .padding()
                .task {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        self.keyboardFocusedField = .field
                    }
                }
                .onReceive(Just(verificationCode)) { _ in
                    if verificationCode.count > pinLength {
                        verificationCode = String(verificationCode.prefix(pinLength))
                    }
                    
                    if verificationCode.count == pinLength && !isAllNumbersFilled {
                        isAllNumbersFilled = true
                        onComplete()
                    } else if verificationCode.count < pinLength {
                        isAllNumbersFilled = false
                    }
                }
        }
    }
}

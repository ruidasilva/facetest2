import SwiftUI
import LocalAuthentication

struct AuthView: View {
    @Binding var isAuthenticated: Bool
    @State private var authError: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "faceid")
                .font(.system(size: 70))
                .foregroundColor(.blue)
            
            Text("Face ID Login")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Please authenticate to access the app")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: authenticate) {
                Text("Authenticate with Face ID")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            if !authError.isEmpty {
                Text(authError)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding()
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                 localizedReason: "Authenticate to access the app") { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                    } else {
                        self.authError = error?.localizedDescription ?? "Authentication failed"
                    }
                }
            }
        } else {
            authError = error?.localizedDescription ?? "Face ID not available"
        }
    }
} 
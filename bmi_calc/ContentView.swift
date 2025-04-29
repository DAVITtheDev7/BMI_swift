import SwiftUI

@main
struct BMIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi: Double?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("BMI Calculator")
                .font(.largeTitle)
                .bold()
            
            TextField("Weight (kg)", text: $weight)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            TextField("Height (cm)", text: $height)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button(action: calculateBMI) {
                Text("Calculate BMI")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            
            if let bmi = bmi {
                Text(String(format: "Your BMI is %.1f", bmi))
                    .font(.title2)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
    
    func calculateBMI() {
        guard let weight = Double(weight),
              let heightCm = Double(height) else {
            return
        }
        
        let heightM = heightCm / 100
        let bmiValue = weight / (heightM * heightM)
        bmi = bmiValue
    }
}

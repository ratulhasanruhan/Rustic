import SwiftUI

struct ContentView: View {
    // 1. UI State Management
    @State private var currentCode: String = "fn main() {\n    println!(\"Hello, Rustic!\");\n}"
    @State private var consoleOutput: String = ""
    @State private var isCompiling: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                // 2. The Code Canvas
                TextEditor(text: $currentCode)
                    .font(.system(.body, design: .monospaced)) // Makes it look like a code editor
                    .autocorrectionDisabled() // Prevents autocorrect from breaking code
                    .textInputAutocapitalization(.never) // Stops "println" from becoming "Println"
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Divider()
                
                // 3. The Terminal / Console Area
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Terminal")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        if isCompiling {
                            ProgressView()
                                .controlSize(.small)
                        }
                    }
                    
                    ScrollView {
                        Text(consoleOutput.isEmpty ? "Waiting for execution..." : consoleOutput)
                            .font(.system(.footnote, design: .monospaced))
                            // Simple logic: if the output has the word "error", turn it red
                            .foregroundColor(consoleOutput.lowercased().contains("error") ? .red : .primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
                .frame(height: 200) // Fixed height for the bottom console
                .background(Color(UIColor.secondarySystemBackground))
            }
            .navigationTitle("Rustic")
            .navigationBarTitleDisplayMode(.inline)
            
            // 4. The Run Button
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: runCode) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Run")
                        }
                        .fontWeight(.bold)
                        .foregroundColor(isCompiling ? .gray : .green)
                    }
                    .disabled(isCompiling)
                }
            }
        }
    }
    
    // Placeholder function for our API call
    private func runCode() {
        isCompiling = true
        consoleOutput = "Compiling..."
        
        // We will replace this with the real API call in the next step!
        // For now, it just fakes a 1.5-second compilation.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isCompiling = false
            consoleOutput = "Hello, Rustic!\n\n[Finished in 1.5s]"
        }
    }
}

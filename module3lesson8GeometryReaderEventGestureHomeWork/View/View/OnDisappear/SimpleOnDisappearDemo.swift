import SwiftUI

struct SimpleOnDisappearDemo: View {
    @Environment(CoreDataAppViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 12) {
                Circle()
                    .fill(viewModel.isRunning ? .green : .red)
                    .frame(width: 20, height: 20)
                
                Text(viewModel.isRunning ? "Таймер работает" : "Таймер остановлен")
                    .font(.headline)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(viewModel.isRunning ? .green.opacity(0.1) : .red.opacity(0.1))
            )
            
            Text("Счётчик: \(viewModel.counterOnDisappear)")
                .font(.custom(GeistLiterataFont.literataRegularBold.rawValue, size: 24))
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
            
            Button(action: {
                if viewModel.isRunning {
                    viewModel.stopTimer()
                } else {
                    viewModel.startTimer()
                }
                
            }) {
                Text(viewModel.isRunning ? "Stop" : "Start")
                    .font(.headline)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(viewModel.isRunning ? .red : .green)
                    )
                    .foregroundColor(.white)
                    .shadow(radius: 4)
            }
            .buttonStyle(.plain) 
            
            Button("Закрыть экран") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 10)
            
            Text("Закройте экран, чтобы увидеть как сработает onDisappear")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.top, 20)
        }
        .padding()
        .onAppear {
            if !viewModel.isRunning {
                viewModel.startTimer()
            }
        }
        .onDisappear {
            viewModel.stopTimer()
        }
    }
}

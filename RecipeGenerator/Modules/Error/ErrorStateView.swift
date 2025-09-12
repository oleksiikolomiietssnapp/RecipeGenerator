import SwiftUI

struct ErrorStateView: View {
    let error: String
    @State private var appearAnimation = false
    @State private var iconAnimation = false

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [.red.opacity(0.3), .orange.opacity(0.1), .clear],
                            center: .center,
                            startRadius: 20,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                    .scaleEffect(iconAnimation ? 1.2 : 1.0)
                    .opacity(iconAnimation ? 0.8 : 0.4)
                    .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: iconAnimation)

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.red.opacity(0.2), .orange.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                    .overlay(
                        Circle()
                            .stroke(
                                LinearGradient(
                                    colors: [.red, .orange],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )

                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 48, weight: .light))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.red, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .scaleEffect(appearAnimation ? 1.0 : 0.5)
                    .rotationEffect(.degrees(appearAnimation ? 0 : -180))
            }
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                    appearAnimation = true
                }
                withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                    iconAnimation = true
                }
            }

            VStack(spacing: 16) {
                Text("Oops! Something went wrong")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(appearAnimation ? 1 : 0)
                    .offset(y: appearAnimation ? 0 : 20)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.2), value: appearAnimation)

                Text(error)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)
                    .opacity(appearAnimation ? 1 : 0)
                    .offset(y: appearAnimation ? 0 : 20)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.4), value: appearAnimation)
            }

            Spacer()
        }
        .padding()
    }
}

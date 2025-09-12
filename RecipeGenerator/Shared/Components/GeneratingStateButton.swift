import SwiftUI

struct GeneratingStateButton: View {
    @Binding var generatingState: GeneratingState
    @Binding var text: String

    var body: some View {
        Button {
            switch generatingState {
            case .idle:
                withAnimation(.easeInOut) {
                    generatingState = .generating
                }
                Task {
                    do {
                        let recipe = try await Intelligence().generateRecipe(with: text)
                        await MainActor.run {
                            withAnimation(.spring()) {
                                generatingState = .generated(recipe)
                            }
                        }
                    } catch {
                        await MainActor.run {
                            withAnimation(.spring()) {
                                generatingState = .error(error.localizedDescription)
                            }
                        }
                    }
                }

            case .generating:
                break

            case .generated, .error:
                withAnimation(.spring()) {
                    text = ""
                    generatingState = .idle
                }
            }
        } label: {
            HStack(spacing: 8) {
                Text(generatingState.actionText)
                    .font(.title2)
                    .frame(maxWidth: .infinity, minHeight: 48)
            }
        }
        .tint(Color.indigo.gradient)
        .buttonStyle(.borderedProminent)
    }
}

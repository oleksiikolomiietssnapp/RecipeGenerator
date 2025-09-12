import SwiftUI

struct ContentView: View {
    @State var error: String?
    @State var recipe: Recipe?
    @State var generatingState: GeneratingState = .idle
    @State var text: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(.regularMaterial)
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    Group {
                        switch generatingState {
                        case .idle:
                            IdleStateView(text: $text)
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .leading).combined(with: .opacity),
                                        removal: .move(edge: .trailing).combined(with: .opacity)
                                    )
                                )

                        case .generating:
                            GeneratingStateView()
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .trailing).combined(with: .opacity),
                                        removal: .move(edge: .leading).combined(with: .opacity)
                                    )
                                )

                        case .generated(let recipe):
                            RecipeDetailView(recipe: recipe)
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .bottom).combined(with: .opacity),
                                        removal: .move(edge: .top).combined(with: .opacity)
                                    )
                                )

                        case .error(let errorMessage):
                            ErrorStateView(error: errorMessage)
                                .transition(
                                    .asymmetric(
                                        insertion: .scale.combined(with: .opacity),
                                        removal: .scale.combined(with: .opacity)
                                    )
                                )
                        }
                    }
                    .animation(.spring(response: 0.7, dampingFraction: 0.8), value: generatingState)
                }
            }
            .navigationTitle("Recipe Generator")
            .navigationBarTitleDisplayMode(.large)
            .safeAreaInset(edge: .bottom) {
                GeneratingStateButton(generatingState: $generatingState, text: $text)
                    .padding()
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .background(
                        Material.regular
                    )
            }
        }
    }
}

#Preview {
}

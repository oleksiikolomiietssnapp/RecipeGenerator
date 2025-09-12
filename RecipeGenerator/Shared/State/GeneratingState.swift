import SwiftUI

enum GeneratingState: Equatable {
    static func == (lhs: GeneratingState, rhs: GeneratingState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.error(let lhsError), .error(let rhsError)): return lhsError == rhsError
        case (.generated(let lhsRecipe), .generated(let rhsRecipe)): return lhsRecipe == rhsRecipe
        case (.generating, .generating): return true
        default: return false
        }
    }

    case idle
    case error(String)
    case generated(Recipe)
    case generating

    var isGenerating: Bool {
        if case .generating = self {
            return true
        } else {
            return false
        }
    }

    var isIdle: Bool {
        if case .idle = self {
            return true
        } else {
            return false
        }
    }

    var actionText: String {
        switch self {
        case .idle:
            return "Generate Recipe"
        case .error:
            return "Try Again"
        case .generated:
            return "New Recipe"
        case .generating:
            return "Generating..."
        }
    }

    var iconSymbol: String {
        switch self {
        case .idle:
            return "sparkles"
        case .error:
            return "exclamationmark.octagon"
        case .generated:
            return "arrow.2.circlepath.circle"
        case .generating:
            return "sparkles"
        }
    }
}

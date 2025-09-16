import Foundation
import FoundationModels

enum IntelligenceError: Error, LocalizedError {
        case modelUnavailable(SystemLanguageModel.Availability.UnavailableReason)

        var errorDescription: String {
            switch self {
            case .modelUnavailable(let reason):
                switch reason {
                case .appleIntelligenceNotEnabled:
                    return "You need to enable Apple Intelligence in Settings."
                case .deviceNotEligible:
                    return "This feature is not available on this device."
                case .modelNotReady:
                    return "The model is currently loading. Please try again later."
                @unknown default:
                    return "Something went wrong"
                }
            }
        }
    }

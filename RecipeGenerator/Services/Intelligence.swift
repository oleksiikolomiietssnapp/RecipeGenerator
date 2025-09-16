import Foundation
import FoundationModels

struct Intelligence {
    public func generate<T: Generable>(
        _ endpoint: IntelligenceEndpoint,
        using argument: IntelligenceEndpoint.PromptArgument
    ) async throws -> T {
        if case .unavailable(let reason) = SystemLanguageModel.default.availability {
            throw IntelligenceError.modelUnavailable(reason)
        }

        let session = LanguageModelSession(instructions: endpoint.instructions)

        let generatedObject = try await session.respond(
            to: endpoint.prompt(argument: argument),
            generating: T.self
        )

        return generatedObject.content
    }
}

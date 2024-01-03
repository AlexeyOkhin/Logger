//
//  Logger.swift
//
//  Created by Djinsolobzik on 20.02.2023.
//

import Foundation

public enum Logger {
    enum LogLevel: String {
        case info
        case error

        fileprivate var prefix: String {
            switch self {
            case .info: return "📗 INFO"
            case .error: return "📕 ERORR"
            }
        }
    }

    struct Context {
        let function: String
        var description: String {
            return "\(function)"
        }
    }

    public static func info(_ message: String, shouldLogContext: Bool = true, function: String = #function) {
        let context = Context(function: function)
        Logger.handleLog(level: .info, message: message.description, shouldLogContext: shouldLogContext, context: context)
    }

    public static func error(_ message: String, shouldLogContext: Bool = true, function: String = #function) {
        let context = Context(function: function)
        Logger.handleLog(level: .error, message: message.description, shouldLogContext: shouldLogContext, context: context)
    }

    fileprivate static func handleLog(level: LogLevel, message: String, shouldLogContext: Bool, context: Context) {

        let logComponents = ["[\(level.prefix)]", message]

        var fullString = logComponents.joined(separator: " ")
        if shouldLogContext {
            fullString += " -> \(context.description)"
        }

        #if DEBUG
        print(fullString)
        #endif
    }
}

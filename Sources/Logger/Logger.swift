//
//  Logger.swift
//
//  Created by Djinsolobzik on 20.02.2023.
//

import Foundation

/// `Logger` is a simple logging utility that allows you to log information and errors with different log levels.
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

    private struct Context {
        let function: String
        var description: String {
            return "\(function)"
        }
    }
    
    /// Info for event with mark "📗 INFO"
    /// - Parameters:
    ///   - message: A string representing the info message.
    ///   - shouldLogContext: A boolean flag indicating whether to include context information in the log. Default is `true`.
    ///   - function: The name of the function where the log message is generated. Default is the calling function.
    public static func info(_ message: String, shouldLogContext: Bool = true, function: String = #function) {
        let context = Context(function: function)
        Logger.handleLog(level: .info, message: message.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    /// Error for event with mark "📕 ERORR"
    /// - Parameters:
    ///   - message: A string representing the error message.
    ///   - shouldLogContext: A boolean flag indicating whether to include context information in the log. Default is `true`.
    ///   - function: The name of the function where the log message is generated. Default is the calling function.
    public static func error(_ message: String, shouldLogContext: Bool = true, function: String = #function) {
        let context = Context(function: function)
        Logger.handleLog(level: .error, message: message.description, shouldLogContext: shouldLogContext, context: context)
    }

    private static func handleLog(level: LogLevel, message: String, shouldLogContext: Bool, context: Context) {

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

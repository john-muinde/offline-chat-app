// Autogenerated from Pigeon (v9.0.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

/// Generated class from Pigeon that represents data sent in messages.
struct Chat {
  var message: String? = nil
  var clients: String? = nil

  static func fromList(_ list: [Any]) -> Chat? {
    let message = list[0] as! String? 
    let clients = list[1] as! String? 

    return Chat(
      message: message,
      clients: clients
    )
  }
  func toList() -> [Any?] {
    return [
      message,
      clients,
    ]
  }
}
private class ChatApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return Chat.fromList(self.readValue() as! [Any])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class ChatApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Chat {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class ChatApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return ChatApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return ChatApiCodecWriter(data: data)
  }
}

class ChatApiCodec: FlutterStandardMessageCodec {
  static let shared = ChatApiCodec(readerWriter: ChatApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol ChatApi {
  func search(keyword: String) throws -> [Chat?]
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class ChatApiSetup {
  /// The codec used by ChatApi.
  static var codec: FlutterStandardMessageCodec { ChatApiCodec.shared }
  /// Sets up an instance of `ChatApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: ChatApi?) {
    let searchChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ChatApi.search", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      searchChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keywordArg = args[0] as! String
        do {
          let result = try api.search(keyword: keywordArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      searchChannel.setMessageHandler(nil)
    }
  }
}
import Foundation

//if let env = loadBaseFiles() {
//  if CommandLine.argc > 1 {
//    for argument in CommandLine.arguments[1...] {
//      let _ = execFile(filename: argument, env: env, options: [.printParse, .printResult])
//    }
//  }
//}

enum ExecOptions {
  case printParse
  case printResult
}

enum ParenState {
  case closed
  case open
  case invalid
}

//func readInput() -> String {
//  var input = ""
//  while let line = readLine(strippingNewline: true) {
//    input += line
//  }
//  return input
//}

func loadBaseFiles(baseDir: String = ".") -> Environment? {
  print(Bundle.main.description)
  let baseFiles = ["base", "stdlib", "arithmetic"]
                  .map {
                    Bundle.main.path(forResource: "\(baseDir)/\($0)", ofType: "lisp")!
                  }
  print(baseFiles)
  let env = defaultEnvironment
  for file in baseFiles {
    guard execFile(filename: file, env: env, options: []) else {
      return nil
    }
  }
  return env
}

func execFile(filename: String,
              env: Environment,
              options: [ExecOptions] = [.printResult]) -> Bool {
  guard let contents = try? String(contentsOfFile: filename, encoding: .utf8) else {
    print("Error reading file \(filename)")
    return false
  }

  guard let exprs = Parser.parse(contents) else {
    print("Error parsing file \(filename)")
    return false
  }

  for expr in exprs {
    if (options.contains(.printParse)) {
      print(expr)
    }
    guard let result = expr.eval(env) else {
      print("Error evaluatng expression in file \(filename)")
      return false
    }

    if options.contains(.printResult) {
      print(result)
    }
  }

  return true
}

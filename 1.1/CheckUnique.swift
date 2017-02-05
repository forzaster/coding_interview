func checkUnique(str: String?) -> Bool {
  guard let target = str else {
    return false
  }

  let count = target.unicodeScalars.count
  for i in 0 ..< count {
    if let i_ = target.index(target.startIndex, offsetBy: i, limitedBy: target.endIndex) {
      let ci = target[i_]
      for j in 0 ..< i {
        if let j_ = target.index(target.startIndex, offsetBy: j, limitedBy: target.endIndex) {
          let cj = target[j_]
          if ci == cj {
              return true
          }
        }
      }
    }
  }
  return false
}

func checkUnique2(str: String?) -> Bool {
  guard let target = str else {
    return false
  }

  var dict: Dictionary<String, Int> = [:]
  let cnt = target.unicodeScalars.count
  for i in 0 ..< cnt {
    if let i_ = target.index(target.startIndex, offsetBy: i, limitedBy: target.endIndex) {
      let ci = String(target[i_])
      if let _ = dict[ci] {
        return true
      }
      dict[ci] = 1
    }
  }
  return false
}

print("Input>", terminator: "")
let line: String? = readLine()
//let result = checkUnique(str: line)
let result = checkUnique2(str: line)
if result {
  print("No Unique")
} else {
  print("Unique")
}

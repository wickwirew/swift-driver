//===--------------- Sanitizer.swift - Swift Sanitizers -------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2019 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

/// Defines a sanitizer that can be used to instrument the resulting product of
/// this build.
public enum Sanitizer: String, Hashable {
  /// Address sanitizer (ASan)
  case address

  /// Thread sanitizer (TSan)
  case thread

  /// Undefined behavior sanitizer (UBSan)
  case undefinedBehavior = "undefined"

  /// libFuzzer integration
  /// - Note: libFuzzer is technically not a sanitizer, but
  ///         it's distributed exactly the same as the sanitizers.
  case fuzzer

  /// The name inside the `compiler_rt` library path (e.g. libclang_rt.{name}.a)
  var libraryName: String {
    switch self {
    case .address: return "asan"
    case .thread: return "tsan"
    case .undefinedBehavior: return "ubsan"
    case .fuzzer: return "fuzzer"
    }
  }
}

// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes=false %s
// RUN: %{explorer} --parser_debug --trace_file=- %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes %s
// AUTOUPDATE: %{explorer} %s
// CHECK: result: 2

package ExplorerTest api;

class A { var n: i32; }

external impl A as DivWith(i32) where .Result == A {
  fn Op[me: Self](rhs: i32) -> A { return {.n = me.n / rhs}; }
}

fn Main() -> i32 {
  var a: A = {.n = 8};
  a = a / 3;
  return a.n;
}

#!/usr/bin/env bats

setup() {
  load "test-helper.bash"
  source "${PROJECT_ROOT}/checks"
}

@test "lb_command_exists() passes" {
  run lb_command_exists command
  assert_success
}

@test "lb_command_exists() fails" {
  run lb_command_exists foo
  assert_failure
}

@test "lb_file_exists() passes" {
  run lb_file_exists "${PROJECT_ROOT}/README.md"
  assert_success
}

@test "lb_file_exists() fails" {
  run lb_file_exists "${PROJECT_ROOT}/foo"
  assert_failure
}

@test "lb_is_null() passes" {
  FOO=""
  run lb_is_null "${FOO}"
  assert_success
}

@test "lb_is_null() fails" {
  run lb_is_null "${PROJECT_ROOT}"
  assert_failure
}

@test "lb_dir_exists() passes" {
  run lb_dir_exists "${PROJECT_ROOT}"
  assert_success
}

@test "lb_dir_exists() fails" {
  run lb_dir_exists "${PROJECT_ROOT}/foo"
  assert_failure
}

@test "lb_is_int() passes" {
  run lb_is_int 1
  run lb_is_int -1
  assert_success
}

@test "lb_is_int() fails" {
  run lb_is_int 1.1
  run lb_is_int "FOO"
  assert_failure
}

@test "lb_is_float() passes" {
  run lb_is_float 1
  run lb_is_float 12
  run lb_is_float -1
  run lb_is_float -12
  run lb_is_float 12.12
  run lb_is_float -12.12
  run lb_is_float .12
  run lb_is_float 0.12
  run lb_is_float -.12
  assert_success
}

@test "lb_is_float() fails" {
  run lb_is_float "FOO"
  run lb_is_float "F12"
  run lb_is_float "F.12"
  run lb_is_float "1."
  assert_failure
}

@test "lb_is_bool() passes" {
  run lb_is_bool 1
  run lb_is_bool 0
  run lb_is_bool true
  run lb_is_bool false
  assert_success
}

@test "lb_is_bool() fails" {
  run lb_is_bool "FOO"
  run lb_is_bool "TRUE"
  run lb_is_bool "FALSE"
  run lb_is_bool 2
  run lb_is_bool -0
  run lb_is_bool -1
  run lb_is_bool ""
  assert_failure
}

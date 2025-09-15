---
description: Returns instructions on how to make tests green
---

# Context

- designDocPath: $ARGUMENTS[0]
- testFilePath: $ARGUMENTS[1]

# Task

Based on the design doc at ${designDocPath}, enable todo tests in ${testFilePath} one by one (it.todo(...) => it(...))
and keep updating code until tests pass,
then move to the next test.

You can check tests are passing using wallaby.
---
name: debugging
description: Systematic root-cause debugging — reproduce, isolate, hypothesize, verify — for bugs, failing tests, crashes, and unexpected behaviour. Use whenever something doesn't work as expected or a stack trace/error is reported.
---

# Debugging

1. **Reproduce** — exact input, command, environment. Write it down. Can't reproduce → ask for logs/steps.
2. **Read the error fully** — message, stack trace top *and* the first frame in our code.
3. **Isolate** — smallest input that fails; `git log`/`git bisect` to find when it started.
4. **Hypothesize** — list 2–3 possible causes, most likely first.
5. **Verify** — add logging/assertions or a failing test to confirm one hypothesis. Change one thing at a time.
6. **Root cause** — ask "why" until you reach the real cause (not "value was null" but "why was it null").
7. **Fix proposal** — minimal change at the root; a regression test that fails before and passes after.
8. **Search for siblings** — Grep for the same pattern elsewhere.

Never "fix" by catching and ignoring the error, adding sleeps, or loosening a test.

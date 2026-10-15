---
name: i-documentation
description: How to write and update project documentation — README, API reference, configuration, CHANGELOG, and code comments — so it stays accurate and useful. Use after features change public behaviour, setup, APIs, or configuration.
---

# Documentation

- **README:** what it is, quick start (install, run, test), configuration, links. Verify every command works.
- **API docs:** for each endpoint/public function — purpose, parameters, response, errors, example.
  Keep OpenAPI/Swagger in sync if the project has it.
- **CHANGELOG:** follow Keep a Changelog — Added / Changed / Deprecated / Removed / Fixed / Security.
- **Code comments:** explain *why*, not *what*. Document public functions' contracts.
- **Plans/ADRs:** mark plan `DONE`; link ADRs from the README architecture section if one exists.
- Write for a new team member. Short sentences, examples over prose.

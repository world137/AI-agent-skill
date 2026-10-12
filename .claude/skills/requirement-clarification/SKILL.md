---
name: requirement-clarification
description: Checklist and rules for deciding when information is missing and how to ask the user good clarifying questions. Use whenever a requirement, bug report, or task is ambiguous, incomplete, or has multiple interpretations — before planning or writing any code. All agents use this.
---

# Requirement Clarification

## Rule
If an unknown would change **what** is built, **how** it behaves, or **whether it is correct**, ask.
If it only affects a minor internal detail, choose a sensible default and **state the assumption** in the plan/handoff.

## Checklist — is each of these known?
- **Goal:** what problem, for whom, why now?
- **Scope:** what is in / out? MVP vs later?
- **Inputs & outputs:** data format, sources, examples
- **Business rules:** calculations, validation, edge cases, permissions (who can do what)
- **Errors:** what should happen on invalid input / external failure?
- **Non-functional:** performance, scale, security, compliance, i18n
- **Integration:** existing APIs, DB schema, third-party services, backward compatibility
- **Acceptance:** how will the user decide it is done?

## How to ask
- Max 5 questions per round, most important first.
- Make them easy to answer: multiple choice or yes/no, each with a **suggested default**.
- Explain briefly why it matters if not obvious.
- Ask in the user's language.

Example:
> 1. ส่วนลดคำนวณก่อนหรือหลัง VAT? (แนะนำ: ก่อน VAT)
> 2. ถ้า payment gateway timeout ให้ retry กี่ครั้ง? (แนะนำ: 3 ครั้ง, exponential backoff)

## Sub-agents
Sub-agents cannot talk to the user directly. Return:
```
STATUS: NEEDS_INPUT
QUESTIONS:
1. ... (default: ...)
```

# AI Dev Team — Repo Template สำหรับพัฒนาโค้ดด้วย AI Agents

Template สำหรับ **Claude Code** ที่จัดทีม AI เป็น agent หลายตัว แต่ละตัวมี skill ของตัวเอง
และทำงานต่อกันตาม workflow: **รับ requirement → วางแผน/ออกแบบ → เขียนโค้ด → review → ทดสอบ → เอกสาร**

## โครงสร้าง

```
.
├── CLAUDE.md                     # กฎหลัก + บทบาท Project Manager (orchestrator) + workflow
├── .claude/
│   ├── settings.json             # permissions + hooks (เช่น auto-format หลังแก้ไฟล์)
│   ├── agents/                   # sub-agents (แต่ละตัวผูกกับ skill ของตัวเอง)
│   │   ├── architect.md
│   │   ├── developer.md
│   │   ├── code-reviewer.md
│   │   ├── security-reviewer.md
│   │   ├── tester.md
│   │   ├── debugger.md           # (เพิ่มจากที่ขอ) หา root cause ของ bug
│   │   └── docs-writer.md        # (เพิ่มจากที่ขอ) อัปเดตเอกสาร
│   ├── skills/                   # skill เฉพาะทาง (SKILL.md + template)
│   │   ├── pm-orchestration/
│   │   ├── requirement-clarification/
│   │   ├── architecture-design/
│   │   ├── implementation-planning/
│   │   ├── codebase-reading/
│   │   ├── code-writing/
│   │   ├── refactoring/
│   │   ├── code-review/
│   │   ├── security-audit/
│   │   ├── test-coverage/
│   │   ├── business-case-testing/
│   │   ├── debugging/
│   │   └── documentation/
│   └── commands/                 # slash commands: /dev /plan /review /test /fix
└── docs/
    ├── plans/                    # แผนงานของแต่ละ feature (single source of truth)
    ├── adr/                      # Architecture Decision Records
    ├── handoffs/                 # บันทึกส่งต่องานระหว่าง agent
    ├── reports/                  # ผล review / security / test
    ├── PROGRESS.md               # สถานะงานรวม (memory ข้าม session)
    ├── CODING_STANDARDS.md
    └── DEFINITION_OF_DONE.md
```

## Agent กับ Skill

| Agent | หน้าที่ | Skills |
|---|---|---|
| **PM** (main session ใน `CLAUDE.md`) | วิเคราะห์ req, ถาม user, เลือก agent, คุม workflow | pm-orchestration, requirement-clarification |
| **architect** | ออกแบบ architecture + แตก task เป็นแผน | architecture-design, implementation-planning, codebase-reading |
| **developer** | อ่านโค้ด, เขียนโค้ด, จัดโครงสร้าง, refactor, group function | codebase-reading, code-writing, refactoring |
| **code-reviewer** | คุณภาพโค้ด, maintainability, ตรงตามแผน | code-review |
| **security-reviewer** | OWASP, secrets, injection, auth, dependency | security-audit |
| **tester** | coverage case + business case | test-coverage, business-case-testing |
| **debugger** | หา root cause จาก error/log | debugging, codebase-reading |
| **docs-writer** | README, API docs, changelog | documentation |

> **ทำไม PM ไม่ใช่ sub-agent?** ใน Claude Code sub-agent เรียก sub-agent ตัวอื่นต่อไม่ได้
> ดังนั้นตัวที่ "สั่งงาน" ได้จริงต้องเป็น main session — เราจึงใส่บทบาท PM ไว้ใน `CLAUDE.md`

## วิธีใช้

1. Copy `CLAUDE.md`, `.claude/` และ `docs/` ไปไว้ที่ root ของโปรเจกต์
2. เติมส่วน **Project-specific context** ใน `CLAUDE.md` (ภาษา, คำสั่ง test/lint)
3. แก้ `docs/CODING_STANDARDS.md` ให้ตรงกับทีม และแก้ hook ใน `.claude/settings.json` ให้ใช้ formatter ของคุณ
4. เปิด `claude` ในโปรเจกต์ แล้วใช้:
   - `/dev <requirement>` — workflow เต็ม (ถาม → plan → dev → review → test)
   - `/plan <requirement>` — ให้ architect วางแผนอย่างเดียว
   - `/review` — review โค้ดที่เปลี่ยน (quality + security)
   - `/test <scope>` — ให้ tester ออกแบบและเขียน test
   - `/fix <bug>` — debugger → developer → regression test

## กฎ "ถามก่อนทำ"

ทุก agent มีกฎเดียวกัน: ถ้า requirement ไม่ชัด, ขาดข้อมูล, หรือตีความได้หลายแบบ → **หยุดและถาม user**
(ดู `.claude/skills/requirement-clarification/SKILL.md`) sub-agent ที่เจอคำถามจะส่งคำถามกลับมาให้ PM เป็นคนถาม user

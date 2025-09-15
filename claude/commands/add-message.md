---
allowed-tools: mcp__browsermcp, mcp__notion
argument-hint: screenshot_path|url [screenshot_path|url]...
description: Add a message to the notion messages database
---

## Context

- Messages database link: https://www.notion.so/marmicode/26c18db3a02d80308c0ac9fe72219662

## Your task

- For each screenshot or url in $ARGUMENTS, do the following:
  - Open the screenshot or navigate to the url (using browser MCP, do not use fetch or any other tool)
  - Extract message information (e.g. title, message, date, sender — not me, i.e. Younes Jaaidi) from the screenshot or the web page
  - Add the message to the messages database and tag it properly
  - Make sure that the message date is set properly
  - If a message from the same sender is already in the database, do not change anything

# Personal Claude Code Instructions

## Communication

- Be terse. Give brief summaries and results, not walkthroughs.
- When a request is ambiguous, ask if the change is large; for small changes, pick a sensible default and note the assumption.

## Languages

- I mostly work in Python, TypeScript/JavaScript, and shell.

## New project defaults

- TypeScript: npm, oxfmt, oxlint, vitest.
- Python: uv, ruff, ty, pytest.
- Always create an `.editorconfig` with sections for the file types the project uses. Always include:

  ```
  [*]
  end_of_line = lf
  insert_final_newline = true
  indent_style = space
  indent_size = 2
  ```

## Code style

- Keep diffs strictly minimal: do only what was asked. Mention other issues you notice instead of fixing them.
- Comments only for non-obvious "why" (constraints, surprises, workarounds). No comments that restate the code.
- Don't leave comments about the current state of things ("today", "currently", "for now"). Comments about planned or deferred expansions of scope or capabilities are fine where appropriate.
- Don't leave comments about a test's pass/fail state. A TODO comment marking a currently failing test that needs fixing is fine.
- Prefer composition and inversion of control / dependency injection for wiring collaborators. Inheritance is the right tool for variants of one build sequence: a base method the subclasses extend via `super()`, in preference to flags or branches.
- Prefer a plain function over a class when the object holds no state that outlives the call. A class whose constructor stores arguments for one method to read is a function.
- Avoid conditionals that select behavior. A parameter that changes what a function does — a mode string, a type discriminator, an optional collaborator (`key_type="ec"`, `issuer=None`) — should become one type per variant, chosen at the call site.
- Prefer a neutral value (`b""`, `[]`, a no-op implementation) over an `if` on the common path.
- Don't collapse a fixed set of distinct cases into a data table plus a loop. Call the function once per case with its arguments at the call site. An object or tuple whose only job is to carry arguments until a later loop reads them adds indirection and separates each case's name from its arguments. Build-a-list-and-iterate is for homogeneous data of unknown length (runtime input), not for a handful of named cases written out in source.
- Put behavior on the type that owns the data. A module-level helper whose only parameter is one object belongs as a method on that object.
- Keep the inputs an object was constructed with as attributes, so downstream code (metadata, logging) reads them from the object instead of re-deriving them.
- Mark overrides explicitly: `@override` in Python, `override` in TypeScript.
- Minimize coupling: functions should take only the values they use, not the object containing them (take `bar`, not `foo` to read `foo.bar`). Don't reach through collaborators (`a.b.c`). Depend on the narrowest interface needed. Keep pure logic separate from I/O.
- Use common interfaces to avoid union types.
- Avoid `instanceof` (or equivalent) type checks to drive behavior; use a common interface instead.

## Testing

- Always add or update tests alongside behavior changes.
- Prefer dependency injection over monkeypatching in tests. Add optional parameters to the code under test where needed to allow it.
- Test behavior, not implementation: don't re-encode the logic under test, and write tests so the implementation can change without the test changing.
- Strongly avoid computing expected values in tests. Hard-code them, either in the test or in an adjacent metadata file (e.g. a PNG fixture's dimensions go in the test or a `metadata.json`).

## Git

- Commit messages: short imperative subject, with a body explaining why when it isn't obvious.
- Commit freely as you go, but confirm before pushing.
- Never amend, squash, rebase, or force-push already-pushed commits without asking.
- To correct an earlier unpushed commit, add a `git commit --fixup <sha>` (or `--squash <sha>`) rather than amending it or rewriting the commit tree. Collapse the fixups with `git rebase --autosquash` as a separate step before pushing, and confirm with me first if any of the commits being rewritten are already pushed.

### Multi-commit changes

- When working in a git repo on a change that spans multiple commits, work through one commit at a time.
- Only move on to the next commit after I confirm I'm satisfied with the current one.

# Zed HAProxy

A [Zed](https://zed.dev) extension that adds syntax highlighting for HAProxy configuration files (`haproxy.cfg`).

It wires up a tree-sitter HAProxy grammar and ships a `highlights.scm` query that maps its nodes to Zed's theme scopes: sections, directives, ACLs, conditionals, values, and comments.

Two community grammars exist: [`thochra/tree-sitter-haproxy`](https://github.com/thochra/tree-sitter-haproxy) and [`Ziehnert/tree-sitter-haproxy`](https://github.com/Ziehnert/tree-sitter-haproxy). This extension pins `thochra`, which parsed my config far more cleanly (3 unparsed lines vs 93).

This extension was assembled mostly from that existing tree-sitter grammar, with the Zed packaging and the highlight query generated with Claude Opus 4.8.

## Disclaimer

This is not a perfect or complete highlighter. It covers the common HAProxy config surface well, but the underlying grammar does not model every directive, and some advanced syntax is left unhighlighted rather than colored precisely. For example, `http-request` converter chains like `req.hdr(host),field(1,:),lower` degrade to plain text rather than breaking. It is good enough for day-to-day config reading, not a full HAProxy language server.

## Install

In Zed, run `zed: install dev extension` from the command palette and select this directory. Highlighting then applies to any `haproxy.cfg`.

## Where fixes go

The grammar is fetched by URL and pinned commit in `extension.toml`, so it is not vendored here and is not a git submodule (Zed reads the pin, not a submodule).

- Parsing bugs (a directive does not parse) belong upstream in [`thochra/tree-sitter-haproxy`](https://github.com/thochra/tree-sitter-haproxy). Once fixed there, bump the `commit` in `extension.toml` to pull the fix down.
- Highlight and scope bugs (wrong color, missing mapping) belong here in `languages/haproxy/highlights.scm`.

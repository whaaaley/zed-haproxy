# Zed HAProxy

A [Zed](https://zed.dev) extension that adds syntax highlighting for HAProxy configuration files (`haproxy.cfg`).

It wires up the [`thochra/tree-sitter-haproxy`](https://github.com/thochra/tree-sitter-haproxy) grammar and ships a `highlights.scm` query that maps its nodes to Zed's theme scopes: sections, directives, ACLs, conditionals, values, and comments.

This extension was assembled mostly from that existing tree-sitter grammar, with the Zed packaging and the highlight query generated with Claude Opus 4.8.

I built it for personal use, but PRs to fix issues are welcome.

## Install

In Zed, run `zed: install dev extension` from the command palette and select this directory. Highlighting then applies to any `haproxy.cfg`.

## Where fixes go

The grammar is fetched by URL and pinned commit in `extension.toml`, so it is not vendored here and is not a git submodule (Zed reads the pin, not a submodule).

- Parsing bugs (a directive does not parse) belong upstream in [`thochra/tree-sitter-haproxy`](https://github.com/thochra/tree-sitter-haproxy). Once fixed there, bump the `commit` in `extension.toml` to pull the fix down.
- Highlight and scope bugs (wrong color, missing mapping) belong here in `languages/haproxy/highlights.scm`.

## Note

The grammar does not fully model some advanced `http-request` converter chains (for example `req.hdr(host),field(1,:),lower`); those lines degrade to plain text rather than breaking.

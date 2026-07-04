# Zed HAProxy

A [Zed](https://zed.dev) extension that adds syntax highlighting for HAProxy configuration files (`haproxy.cfg`).

It wires up the [`thochra/tree-sitter-haproxy`](https://github.com/thochra/tree-sitter-haproxy) grammar and ships a `highlights.scm` query that maps its nodes to Zed's theme scopes: sections, directives, ACLs, conditionals, values, and comments.

This extension was assembled mostly from that existing tree-sitter grammar, with the Zed packaging and the highlight query generated with Claude Opus 4.8.

## Install

In Zed, run `zed: install dev extension` from the command palette and select this directory. Highlighting then applies to any `haproxy.cfg`.

## Note

The grammar does not fully model some advanced `http-request` converter chains (for example `req.hdr(host),field(1,:),lower`); those lines degrade to plain text rather than breaking.

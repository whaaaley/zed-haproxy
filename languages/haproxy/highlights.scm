; Comments
(comment) @comment

; Section headers (global, defaults, frontend, backend, listen, ...)
(global_section "global" @keyword)
(defaults_section "defaults" @keyword)
(frontend_section "frontend" @keyword)
(backend_section "backend" @keyword)
(listen_section "listen" @keyword)
(resolvers_section "resolvers" @keyword)
(userlist_section "userlist" @keyword)
(peers_section "peers" @keyword)
(mailers_section "mailers" @keyword)
(cache_section "cache" @keyword)
(program_section "program" @keyword)
(ring_section "ring" @keyword)

; The name a section declares, and references to it
(section_name) @type
(backend_ref) @type
(server_name) @variable
(acl_name) @variable
(cookie_name) @variable
(option_name) @property
(directive_name) @property

; Enum-like values carried by *_type and *_options nodes
(mode_type) @constant
(log_level) @constant
(tcp_type) @constant
(capture_type) @constant
(balance_algorithm) @constant
(hash_algorithm) @constant
(format_type) @constant
(check_action) @constant
(http_action) @constant
(tcp_action) @constant
(http_status) @constant.numeric

; Addresses, values, literals
(bind_address) @string.special
(server_address) @string.special
(address) @string.special
(log_target) @string.special
(path) @string.special.path
(string) @string
(number) @number
(size) @number
(time_value) @number

; Conditional control flow (if / unless)
(condition) @keyword.control

; All directive-leading keywords are anonymous literals in the grammar;
; match them generically so every directive keyword is highlighted.
[
  "log"
  "mode"
  "bind"
  "balance"
  "server"
  "acl"
  "option"
  "timeout"
  "maxconn"
  "user"
  "group"
  "redirect"
  "cookie"
  "capture"
  "stats"
  "stick"
  "http-request"
  "http-response"
  "http-check"
  "tcp-request"
  "tcp-check"
  "use_backend"
  "default_backend"
  "use-server"
  "chroot"
  "pidfile"
  "nbproc"
  "nbthread"
  "node"
  "description"
  "retries"
] @keyword

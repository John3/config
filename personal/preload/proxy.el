;(setq url-proxy-services '(("no_proxy" . "work\\.com")
;("http" . "proxya.mx.corp:8010")))

(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|localhost.*\\)")
     ("http" . "proxya.mx.corp:8010")
     ("https" . "proxya.mx.corp:8010")))

(setq url-http-proxy-basic-auth-storage
    (list (list "proxya.mx.corp:8010"
                (cons "Input your LDAP UID !"
                      (base64-encode-string "Z460476:S3santan")))))

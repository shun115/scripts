(add-load-path ".")
(load "procedures")

(insertR 'b 'a '(a c d e))
(insertL 'b 'a '(a c d e))
(subst 'b 'a '(a c d e))


#-asdf3.1 (error "Minimal requirement: ASDF 3.1!")
(asdf:defsystem :jin.curfew
  :description "Self-control is an illusion."
  :version "1.0.0"
  :serial t
  :depends-on (:local-time)
  :components ((:file "package")
               (:file "src/utils")
               (:file "src/action/kill-app")
               (:file "src/action/kill-user")
               (:file "src/action/slock")
               (:file "src/action/url-lock")
               (:file "src/main"))
  :build-operation "program-op"
  :build-pathname "bin/curfew"
  :entry-point "jin.curfew:main"
)

#+sb-core-compression
(defmethod asdf:perform ((o asdf:image-op) (c asdf:system))
  (uiop:dump-image (asdf:output-file o c) :executable t :compression t))

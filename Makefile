LISP ?= sbcl

build:
	$(LISP) --load jin.curfew.asd \
    	--eval '(ql:quickload :jin.curfew)' \
		--eval '(asdf:make :jin.curfew)' \
		--eval '(quit)'

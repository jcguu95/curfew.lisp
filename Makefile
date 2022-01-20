LISP ?= sbcl

build:
	$(LISP) --load curfew.asd \
    	--eval '(ql:quickload :curfew)' \
		--eval '(asdf:make :curfew)' \
		--eval '(quit)'

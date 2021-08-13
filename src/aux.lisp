(in-package :jin.curfew)

(defun apply-functions (fs e)
  ;; test: (apply-functions (list #'not #'not) nil) => (t t)
  (loop for f in fs
        collect (funcall f e)))

(defun func-and (&rest funcs)
  "#'AND, but lifted to the functional level."
  (lambda (x) (eval (append '(and)
                            (apply-functions funcs x)))))

(defun func-or (&rest funcs)
  "#'OR, but lifted to the functional level."
  (lambda (x) (eval (append '(or)
                            (apply-functions funcs x)))))

(defun func-not (func)
  "#'NOT, but lifted to the functional level."
  (lambda (x) (not (funcall func x))))

;; file aux functions
(defun get-file (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
          while line
          collect line)))

;; time predicates
(defun time-within (t0 t1)
  "Return a function: time \\mapsto (time \\in [t0,t1])."
  (lambda (time)
    (if (<= t0 t1)
        (<= t0 time t1)
        (or (<= t0 time)
            (>= t1 time)))))

(defun hour ()
  (local-time:timestamp-hour (local-time:now)))

(defun minute ()
  (local-time:timestamp-hour (local-time:now)))

(defun now ()
  "Encode current time in a >4-digit integer. For example,
     08:30am =>  830
     12:30pm => 1230
     10:30pm => 2230."
  (+ (* 100 (hour)) (minute)))

;; ;; instruction handling
;; (defun within=>do (pair)
;;   (assert (eq (length pair) 2))
;;   (let ((interval (car pair))
;;         (action (car (cdr pair))))
;;     (when (funcall (apply #'time-within interval) (now))
;;       (eval action))))

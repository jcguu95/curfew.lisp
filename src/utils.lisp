(in-package :jin.curfew)

;; file 
(defun get-file (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
          while line
          collect line)))

;; time
(defun hour ()
  (local-time:timestamp-hour (local-time:now)))

(defun minute ()
  (local-time:timestamp-minute (local-time:now)))

(defun current ()
  "Encode current time in a <=4-digit integer. For example,
     08:30am =>  830
     12:30pm => 1230
     10:30pm => 2230."
  (+ (* 100 (hour)) (minute)))

(defun between? (t0 t1)
  ;; Expect T0 and T1 to be a <=4-digit integer.
  (if (<= t0 t1)
    (<= t0 (current) t1)
    (or (<= t0 (current)) (<= (current) t1))))

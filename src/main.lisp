(in-package :jin.curfew)

(defun main ()
  (let ((gap 10)
        (urls '("www.youtube.com" "news.ycombinator.com" "www.reddit.com" "old.reddit.com"
                "www.facebook.com" "www.messenger.com" "www.instagram.com" "chat.freenode.net")))
    (loop (sleep gap)

          (ignore-errors

           (if (<= 55 (minute) 59)
               (mapcar #'unlock-url urls)
               (mapcar #'lock-url urls))

           (cond
             ((between? 2030 0230) (kill-user "jin"))
             ;; ((time-within 0230 0500) (slock-all "jin"))
             ((between? 0230 2030) (continue-user "jin")))))))

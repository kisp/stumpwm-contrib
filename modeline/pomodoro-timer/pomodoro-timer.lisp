;;; A countdown timer for pomodoros.
;;;
;;; Copyright 2015 Kilian Sprotte
;;;

(in-package :stumpwm)

(defvar *pomodoro-timer-start* nil)

(defvar *pomodoro-duration* (* 25 60))

(defun fmt-pomodoro-timer (ml)
  (declare (ignore ml))
  (if (not *pomodoro-timer-start*)
      ""
      (let ((remaining-minutes
              (floor (- *pomodoro-duration*
                        (- (get-universal-time) *pomodoro-timer-start*))
                     60)))
        (if (< remaining-minutes 0)
            (progn
              (setq *pomodoro-timer-start* nil)
              "")
            (format nil (if (<= remaining-minutes 5) "^[^B^1*~Dm^]" "~Dm")
                    remaining-minutes)))))

(defcommand pomodoro-timer-start () ()
  "Start pomodoro timer."
  (setq *pomodoro-timer-start* (get-universal-time))
  (run-shell-command "bell25m"))

(defcommand pomodoro-timer-stop () ()
  "Stop pomodoro timer."
  (setq *pomodoro-timer-start* nil)
  (run-shell-command "killall bell25m"))

(add-screen-mode-line-formatter #\p 'fmt-pomodoro-timer)

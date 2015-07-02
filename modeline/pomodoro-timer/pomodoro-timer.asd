(asdf:defsystem #:pomodoro-timer
  :description "Pomodoro timer for the StumpWM modeline"
  :author "Kilian Sprotte <kilian.sprotte@gmail.com>"
  :license "2-CLAUSE BSD (see COPYRIGHT file for details)"
  :depends-on (#:stumpwm)
  :serial t
  :components ((:file "pomodoro-timer")))

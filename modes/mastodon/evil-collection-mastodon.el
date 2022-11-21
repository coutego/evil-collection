;;; evil-collection-mastodon.el --- Evil bindings for mastodon-mode -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Pedro Abelleira Seco
;;
;; Author: Pedro Abelleira Seco <coutego@gmail.com>
;; Maintainer: Pedro Abelleira Seco <coutego@gmail.com>
;; URL: https://github.com/emacs-evil/evil-collection
;; Version: 0.0.1
;; Package-Requires: ((emacs "26.3"))
;; Keywords: evil, news, tools
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 3, or (at your
;; option) any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;
;;; Commentary:
;; Evil bindings for mastodon.
;;
;;; Code:

(require 'evil-collection)
(require 'mastodon nil t)


(defconst evil-collection-mastodon-maps '(mastodon-mode-map
                                            mastodon-button-map))



;;;###autoload
(defun evil-collection-mastodon-setup ()
  (evil-collection-set-readonly-bindings 'mastodon-mode-map)
  (evil-collection-define-key 'normal 'mastodon-mode-map

    "]]"      'mastodon-tl--goto-next-toot
    "[["      'mastodon-tl--goto-prev-toot
    "gj"      'mastodon-tl--next-tab-item ; use 'gj'?
    "gk"      'mastodon-tl--previous-tab-item ; use 'gk'?

    ;; navigation out of mastodon
    (kbd ", q")   'kill-current-buffer
    (kbd ", Q")   'kill-buffer-and-window

    ;; navigation between timelines
    (kbd ", #")   'mastodon-tl--get-tag-timeline
    (kbd ", A")   'mastodon-profile--get-toot-author
    (kbd ", F")   'mastodon-tl--get-federated-timeline
    (kbd ", H")   'mastodon-tl--get-home-timeline
    (kbd ", L")   'mastodon-tl--get-local-timeline
    (kbd ", N")   'mastodon-notifications--get
    (kbd ", P")   'mastodon-profile--show-user
    (kbd ", T")   'mastodon-tl--thread

     ;; timeline actions
    (kbd ", b")   'mastodon-toot--toggle-boost
    (kbd ", c")   'mastodon-tl--toggle-spoiler-text-in-toot
    (kbd ", f")   'mastodon-toot--toggle-favourite
    (kbd ", r")   'mastodon-toot--reply
    (kbd ", u")   'mastodon-tl--update

    ;; new toot
    (kbd ", t")   'mastodon-toot

    ;; override special mode binding
    "g"       'undefined ; FIXME: check whether this is needed

    ;; mousebot additions
    (kbd ", W")   'mastodon-tl--follow-user
    (kbd "C-S-W")   'mastodon-tl--unfollow-user
    (kbd ", B")   'mastodon-tl--block-user
    (kbd "C-S-B")   'mastodon-tl--unblock-user
    (kbd ", M")   'mastodon-tl--mute-user
    (kbd "C-S-M")   'mastodon-tl--unmute-user
    (kbd ", O")   'mastodon-profile--my-profile
    (kbd ", S")   'mastodon-search--search-query
    (kbd ", d")   'mastodon-toot--delete-toot
    (kbd ", D")   'mastodon-toot--delete-and-redraft-toot
    (kbd ", C")   'mastodon-toot--copy-toot-url
    (kbd ", i")   'mastodon-toot--pin-toot-toggle
    (kbd ", V")   'mastodon-profile--view-favourites
    (kbd ", R")   'mastodon-profile--view-follow-requests
    ;; ", h" 'mastodon-async--stream-home
    ;; ", f" 'mastodon-async--stream-federated
    ;; ", l" 'mastodon-async--stream-local
    ;; ", n" 'mastodon-async--stream-notifications
    (kbd ", U")   'mastodon-profile--update-user-profile-note
    (kbd ", a")   'mastodon-notifications--follow-request-accept
    (kbd ", j")   'mastodon-notifications--follow-request-reject
    (kbd ", v")   'mastodon-tl--poll-vote
    (kbd ", k")   'mastodon-toot--bookmark-toot-toggle
    (kbd ", K")   'mastodon-profile--view-bookmarks
    (kbd ", I")   'mastodon-tl--view-filters
    (kbd ", G")   'mastodon-tl--get-follow-suggestions
    ;; (when (require 'lingva nil :no-error)
    ;;   (define-key map (kbd "s") #'mastodon-toot--translate-toot-text))
    ;; map)
    ))

(provide 'evil-collection-mastodon)
;;; evil-collection-mastodon.el ends here

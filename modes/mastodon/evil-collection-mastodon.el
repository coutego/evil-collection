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
    (kbd "C-c q")   'kill-current-buffer
    (kbd "C-c Q")   'kill-buffer-and-window

    ;; navigation between timelines
    (kbd "C-c #")   'mastodon-tl--get-tag-timeline
    (kbd "C-c A")   'mastodon-profile--get-toot-author
    (kbd "C-c F")   'mastodon-tl--get-federated-timeline
    (kbd "C-c H")   'mastodon-tl--get-home-timeline
    (kbd "C-c L")   'mastodon-tl--get-local-timeline
    (kbd "C-c N")   'mastodon-notifications--get
    (kbd "C-c P")   'mastodon-profile--show-user
    (kbd "C-c T")   'mastodon-tl--thread

     ;; timeline actions
    (kbd "C-c b")   'mastodon-toot--toggle-boost
    (kbd "C-c c")   'mastodon-tl--toggle-spoiler-text-in-toot
    (kbd "C-c f")   'mastodon-toot--toggle-favourite
    (kbd "C-c r")   'mastodon-toot--reply
    (kbd "C-c u")   'mastodon-tl--update

    ;; new toot
    (kbd "C-c t")   'mastodon-toot

    ;; override special mode binding
    "g"       'undefined ; FIXME: check whether this is needed

    ;; mousebot additions
    (kbd "C-c W")   'mastodon-tl--follow-user
    (kbd "C-S-W")   'mastodon-tl--unfollow-user
    (kbd "C-c B")   'mastodon-tl--block-user
    (kbd "C-S-B")   'mastodon-tl--unblock-user
    (kbd "C-c M")   'mastodon-tl--mute-user
    (kbd "C-S-M")   'mastodon-tl--unmute-user
    (kbd "C-c O")   'mastodon-profile--my-profile
    (kbd "C-c S")   'mastodon-search--search-query
    (kbd "C-c d")   'mastodon-toot--delete-toot
    (kbd "C-c D")   'mastodon-toot--delete-and-redraft-toot
    (kbd "C-c C")   'mastodon-toot--copy-toot-url
    (kbd "C-c i")   'mastodon-toot--pin-toot-toggle
    (kbd "C-c V")   'mastodon-profile--view-favourites
    (kbd "C-c R")   'mastodon-profile--view-follow-requests
    ;; "C-c h" 'mastodon-async--stream-home
    ;; "C-c f" 'mastodon-async--stream-federated
    ;; "C-c l" 'mastodon-async--stream-local
    ;; "C-c n" 'mastodon-async--stream-notifications
    (kbd "C-c U")   'mastodon-profile--update-user-profile-note
    (kbd "C-c a")   'mastodon-notifications--follow-request-accept
    (kbd "C-c j")   'mastodon-notifications--follow-request-reject
    (kbd "C-c v")   'mastodon-tl--poll-vote
    (kbd "C-c k")   'mastodon-toot--bookmark-toot-toggle
    (kbd "C-c K")   'mastodon-profile--view-bookmarks
    (kbd "C-c I")   'mastodon-tl--view-filters
    (kbd "C-c G")   'mastodon-tl--get-follow-suggestions
    ;; (when (require 'lingva nil :no-error)
    ;;   (define-key map (kbd "s") #'mastodon-toot--translate-toot-text))
    ;; map)
    ))

(provide 'evil-collection-mastodon)
;;; evil-collection-mastodon.el ends here

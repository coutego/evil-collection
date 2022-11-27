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

    "]]"          '("Next toot" . mastodon-tl--goto-next-toot)
    "[["          '("Previous toot" . mastodon-tl--goto-prev-toot)
    "gj"          '("Next tab item" . mastodon-tl--next-tab-item)
    "gk"          '("Previus tab item" . mastodon-tl--previous-tab-item)

    ;; navigation out of mastodon
    (kbd ", q")   '("Kill curr buffer" . kill-current-buffer)
    (kbd ", Q")   '("Kill buffer & window" . kill-buffer-and-window)

    ;; navigation between timelines
    (kbd ", #")   '("Tag timeline" . mastodon-tl--get-tag-timeline)
    (kbd ", A")   '("Toot author" . mastodon-profile--get-toot-author)
    (kbd "<leader> F")   '("Federated timeline" . mastodon-tl--get-federated-timeline)
    (kbd ", H")   '("Home timeline" . mastodon-tl--get-home-timeline)
    (kbd ", L")   '("Local timeline" . mastodon-tl--get-local-timeline)
    (kbd ", N")   '("Notifications" . mastodon-notifications--get)
    (kbd ", P")   '("Show user" . mastodon-profile--show-user)
    (kbd ", T")   '("Thread" . mastodon-tl--thread)

     ;; timeline actions
    (kbd ", b")   '("Toggle boost" . mastodon-toot--toggle-boost)
    (kbd ", c")   '("Toggle spoiler" . mastodon-tl--toggle-spoiler-text-in-toot)
    (kbd ", f")   '("Tooggle favourite" . mastodon-toot--toggle-favourite)
    (kbd ", r")   '("Reply" . mastodon-toot--reply)
    (kbd ", u")   '("Update" . mastodon-tl--update)

    ;; new toot
    (kbd ", t")   '("Toot" . mastodon-toot)

    ;; mousebot additions
    (kbd ", W")   '("Follow user" . mastodon-tl--follow-user)
    (kbd ", C-W") '("Unfollow user" . mastodon-tl--unfollow-user)
    (kbd ", B")   '("Block user" . mastodon-tl--block-user)
    (kbd ", C-B") '("Unblock user" . mastodon-tl--unblock-user)
    (kbd ", M")   '("Mute user" . mastodon-tl--mute-user)
    (kbd ", C-M") '("Unmute user" . mastodon-tl--unmute-user)
    (kbd ", O")   '("My profile" . mastodon-profile--my-profile)
    (kbd ", S")   '("Search query" . mastodon-search--search-query)
    (kbd ", d")   '("Delete toot" . mastodon-toot--delete-toot)
    (kbd ", D")   '("Redraft toot" . mastodon-toot--delete-and-redraft-toot)
    (kbd ", C")   '("Toot url" . mastodon-toot--copy-toot-url)
    (kbd ", i")   '("Toot toogle" . mastodon-toot--pin-toot-toggle)
    (kbd ", V")   '("View favourites" . mastodon-profile--view-favourites)
    (kbd ", R")   '("View follow requests" . mastodon-profile--view-follow-requests)
    ;; "C-c h" 'mastodon-async--stream-home
    ;; "C-c f" 'mastodon-async--stream-federated
    ;; "C-c l" 'mastodon-async--stream-local
    ;; "C-c n" 'mastodon-async--stream-notifications
    (kbd ", U")   '("Update user profile note" . mastodon-profile--update-user-profile-note)
    (kbd ", a")   '("Accept follow request" . mastodon-notifications--follow-request-accept)
    (kbd ", j")   '("Reject follow request" . mastodon-notifications--follow-request-reject)
    (kbd ", v")   '("Vote on poll" . mastodon-tl--poll-vote)
    (kbd ", k")   '("Toggle bookmark toot" . mastodon-toot--bookmark-toot-toggle)
    (kbd ", K")   '("View bookmarks" . mastodon-profile--view-bookmarks)
    (kbd ", I")   '("View filters" . mastodon-tl--view-filters)
    (kbd ", G")   '("Follow suggestions" . mastodon-tl--get-follow-suggestions)
    ;; (when (require 'lingva nil :no-error)
    ;;   (define-key map (kbd "s") #'mastodon-toot--translate-toot-text))
    ;; map)
    ))

(provide 'evil-collection-mastodon)
;;; evil-collection-mastodon.el ends here

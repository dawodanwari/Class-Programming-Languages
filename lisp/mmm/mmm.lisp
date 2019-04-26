(defun min-mean-max (xs)

(setq min (car xs) max (car xs ))
(setq count 0 mean 0)

(defun alll (xr)
(setq count (+ count 1)  mean (+ (car xr) mean ) )

(cond ((> min (car xr)) (setq min (car xr)))
      ((< max (car xr)) (setq max (car xr))) )

(cond ((null (cdr xr))   (list min (/ mean count) max)   )
      (t  (alll (cdr xr)) )
)
)

  (alll xs)
    ;; TODO: Incomplete function
    ;; The next line should not be in your solution.
    ;;(list 'incomplete)
)

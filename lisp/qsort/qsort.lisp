(defun myAppend (s b)
(cond
      ;NO B
      ( (and (null b) (atom s)) (list s) ) ;s is num
      ((and (null  b) (null  (cdr s)) )  (car s)  ) ;s is list
      ( (null  b)  s ) ;s is list
      ;NO S
      ( (and (null s) (atom b)) (list b) ) ;b is num
      ((and (null  s) (null  (cdr b)) )  (car b)  ) ; b is list
      ( (null  s)  b ) ; b is list

      ( (and (atom s) (atom b) )   (cons s (cons b nil)) ) ;both nums, return list of both
      ( (atom s)    (cons s  b ) ) ; s is num b is list
      ( (and (atom b) (null (cdr s)) )   (cons (car s) (cons b nil) ) ) ;b is num s is list
      ( (atom b)    (cons (car s) (myAppend (cdr s) b) ) ) ;b is num s is list

      ( (null (cdr s))    (cons (car s)  b  ) ) ; append s to b
      ( (null (cdr b))    (cons (car s) (myAppend (cdr s) b) ) ) ;append b to s recusively

      (t  (cons (car s) (myAppend (cdr s) b) ) ) )  ;all else recurse
)

(defun pivot (n xs)
  (setq smaller '() bigger '())

  (defun iterate (m xr)
  (cond ((> m (car xr)) (setq smaller (myAppend smaller (car xr))) ) ;add to smaller list
        ((<= m (car xr))  (setq bigger  (myAppend bigger  (car xr))) )  ) ;add to larger list

  (cond ((null (cdr xr))   (list smaller bigger)   );returning lists
        (t  (iterate m (cdr xr)) ) ) ;recurse

  )

  (cond ((null xs) (list nil nil )) ;base case for pivot
        (t (iterate n xs ) ) ) ;iniate
)

(defun quicksort (xs)
  (cond ((null xs)  NIL  )
        ((null (cdr xs))   xs )
    (t (let* ( (small (car (pivot (car xs) (cdr xs) )))  (big (car (cdr (pivot (car xs) (cdr xs ))) )))
    (myAppend (myAppend (quicksort small) (car xs) ) (quicksort big))
     )
     )
)


  ; (setq  piv (car xs) xr (cdr xs) )
  ; (let ( (small (car (pivot piv xr )))  (big (cdr (pivot piv xr ))) )
  ;     (myAppend (myAppend (quicksort small) piv) (quicksort big)) )
)
  ;;(cond ((null big) (myAppend (quicksort small) piv) )
  ;;      ((null small) (app piv (quicksort big) ) ) )
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  ;;(list 'incomplete)

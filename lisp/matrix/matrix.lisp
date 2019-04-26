
(defun matrix-add (m1 m2)
  (mapcar (lambda (p1 p2) (mapcar #'+ p1 p2) )m1 m2)
)

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

(defun matrix-multiply (a b)
    (defun dot (z1 z2)
      (apply #'+ (mapcar #'* z1 z2))
    )


    (defun outer (c1 c2)
      (cond
        ((null (cdr c2)) (list (dot (car c1) (car c2))) ) ;if the rest of c2 is null
        (t (myAppend (dot (car c1) (car c2))  (outer c1 (cdr c2))  ))
      )
    )

    (defun inner (b1 b2)
      (cond
      ;  ( (null (cdr b1)
        ((null (cdr b1)) (list (outer b1 b2) ) )
        (t (list (outer b1 b2)  (outer (cdr b1) b2) ))
      )
    )


    ;(defun helper (x1 x2)
    ;(mapcar (lambda (y1 y2) (mapcar #'dot y1 y2)) x1 x2 )
    ;)
    (setq e (matrix-transpose b))
    (inner a e)
    ;(mapcar (lambda (p1 p2) (mapcar #'dot p1 p2) )a e)
    ;(maplist #'dot a e)

)
(defun matrix-transpose (m)
    (apply #'mapcar #'list m)
)

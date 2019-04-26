(defun final (li)
    (cond
      ( (null li) nil)
      ( (null (car li)) (final (cdr li)) )
      (t t)
    )
)

(defun reachable (transition start final input)
    (cond
      ((and (null input) (eql start final)) t)
      ((null input) nil)
      (t
        (let (( pos (funcall transition start (car input))) )
         (final (mapcar (lambda (p) (reachable transition p final (cdr input)) ) pos) )
        )


      )
      )

)

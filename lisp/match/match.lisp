(defun match (pattern assertion)
(cond
  ((and (null pattern) (null assertion)) t ) ;if they are the both null, return true
  ((or (null pattern) (null assertion)) nil ) ;if only one is null, return false
  ((eql (car pattern) (car assertion)) (match (cdr pattern) (cdr assertion))) ;if the cars match check cdr
  ((eql (car pattern) '? ) (match (cdr pattern) (cdr assertion)));if ?, skip car assertion

  ( (eql (car pattern) '! ) ;if !
     (cond
       ((match (cdr pattern) (cdr assertion)) t)  ;check if the rest of list matches
       (t (match pattern (cdr assertion)) ) )
  )

  (t nil)
  )
  )

(define (make-table)
  (cons '*table* '()))

;making a table
(define t (make-table))
(define (empty-table? t) (null? (cdr t)))

;step 1 - trace through lookup and associ to make you understand what they do
(define (lookup key table)
  (let ((record (associ key (cdr table))))
    (if record
        (cdr record)
        #f)))

(define (associ key records)
  (cond ((null? records) #f)
        ((equal? key (caar records)) (car records))
        (else (associ key (cdr records)))))

;Partners work together to write insert!
(define (insert! key value table)
  (let ((record (associ key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'done)
        
;Partners work together to write delete! which a deletes key/value pair from table
(define (delete! key table)
  (let ((record (associ key (cdr table))))
    (cond ((not record) "Key not in table")
          ((equal? key (caadr table)) (set-cdr! table (cddr table))
                                  record)
          (else (delete! key (cdr table))))))


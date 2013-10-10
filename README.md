![ScreenShot](http://i.imgur.com/syTQkYh.png)

This is an implementation of the algorithm described [here](http://paulbourke.net/papers/triangulate/)

Clone this repo into your quicklisp local projects and:

    (ql:quickload :lofi.tri)
    (defvar *test-points* (lofi.tri:random-point-array 100))
    (defvar *test-triangulation* (lofi.tri:triangulate *test-points*))
    ;; *test-triangulation* is a list of triangle structures.

The `lofi.tri:triangle` struct has a slot `verts` which you can use as indices into the array of points
you provided the triangulate function. To get something like the screenshot above:

    (defun draw-circle (center radius)
      (let* ((step 5)
             (seg-max (- 360 step))
             (trig-step 0.0174))
      (gl:with-primitive :line-loop
        (loop for i from 0 upto seg-max by step
           do (let ((x (+ (aref center 0) (* radius (sin (* trig-step i)))))
                    (y (+ (aref center 1) (* radius (cos (* trig-step i))))))
                (gl:vertex x y 0))))))
              
    ;; Draw the triangulation
    (loop for tri in *test-triangulation*
       do (progn
            ;; Draw the circumcircles
            (gl:color 0.15 0.05 0.15 0.05)
            (gl:line-width 1)
            (let ((cir (slot-value tri 'lofi.tri:circumcircle)))
              (draw-circle (slot-value cir 'lofi.tri:center) (slot-value cir 'lofi.tri:radius)))

            ;; Draw the triangles
            (gl:color 0 0.25 1 0.25)
            (gl:line-width 2)
            (gl:with-primitive :triangles
              (let ((verts (slot-value tri 'lofi.tri:verts)))
                (loop for i from 0 upto 2
                   do (let* ((vi (aref verts i))
                             (v (aref *test-points* vi)))
                        ;(print v)
                        (gl:vertex (aref v 0) (aref v 1) (aref v 2))
                        ))))))

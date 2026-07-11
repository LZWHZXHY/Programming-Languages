(*badly named: evaluates to 0 on empty list*)
fun good_max(xs: int list) = 
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else 
        (* for style, could also use a let-binding for (hd xs) *)
        let val tl_ans = good_max(tl xs)
        in
            if hd xs > tl_ans
            then hd xs
            else tl_ans
        end
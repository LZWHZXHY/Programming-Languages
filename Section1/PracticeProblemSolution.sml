fun alternate(xs: int list) = 
    if null xs
    then 0
    else (hd xs) - alternate(tl xs) 

fun min_max(xs: int list) = 
    if null (tl xs)
    then (hd xs, hd xs)
    else
        let 
            val current = hd xs
            val (min_rest, max_rest) = min_max(tl xs)
        in
            if current > max_rest
            then (min_rest, current)
            else
                if current < min_rest
                then (current, max_rest)
            else
                (min_rest, max_rest)
        end

fun cumsum(xs: int list) = 
    let 
        fun helper(list_left, acc) = 
            if null list_left
            then []
            else 
                let 
                    val current_sum = acc + hd list_left
                in 
                    current_sum :: helper(tl list_left, current_sum)
                end
    in
        helper(xs, 0)
    end


fun greeting(name_opt: string option) = 
    if isSome(name_opt)
    then "Hello there, "^valOf(name_opt)^"!"
    else "Hello there, you!"

fun repeat(xs: int list, ys: int list) =
    if null ys
    then []
    else
        let 
            fun repeat_num(x: int, y: int) = 
                if y = 0
                then []
                else
                    x::repeat_num(x, y-1)
        in
            repeat_num((hd xs), (hd ys)) @ repeat((tl xs),(tl ys))
        end

fun addOpt(x: int option, y: int option)=
    if isSome(x) andalso isSome(y)
    then SOME(valOf(x) + valOf(y))
    else NONE

fun addAllOpt(xs: int option list) =
    if null xs
    then NONE
    else
        addOpt((hd xs), addAllOpt(tl xs))

fun any(xs: bool list) = 
    if null xs
    then false
    else 
        if hd xs = true 
        then true
        else any(tl xs)

fun all(xs:bool list) = 
    if null xs
    then true
    else 
        if hd xs = false
        then false
        else all(tl xs)

fun zip(xs: int list, ys: int list) =
    if null xs orelse null ys
    then []
    else
        ((hd xs),(hd ys)):: zip(tl xs, tl ys)
 
fun zipRecycle (xs, ys) =
    let
        fun helper (curr_xs, curr_ys, original_xs) =
            if null curr_ys
            then []
            else 
                if null curr_xs
                then helper (original_xs, curr_ys, original_xs)
                else (hd curr_xs, hd curr_ys) :: helper (tl curr_xs, tl curr_ys, original_xs)
    in
        helper (xs, ys, xs)
    end

fun zipOpt (xs, ys) =
    if null xs andalso null ys
    then SOME []
    else if null xs orelse null ys
    then NONE
    else 
        let 
            val rest = zipOpt (tl xs, tl ys)
        in
            if isSome rest
            then SOME ((hd xs, hd ys) :: valOf rest)
            else NONE
        end

fun lookup(xs: (string * int) list, str: string) =
    if null xs
    then NONE
    else 
        if (#1 (hd xs)) = str
        then SOME (#2 (hd xs))
        else
            lookup(tl xs, str)
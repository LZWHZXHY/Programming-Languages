fun is_older( date1 : int * int * int, date2 : int * int * int) = 
    if (#1 date1) < (#1 date2)
    then true
    else if(#1 date1) > (#1 date2)
    then false
    else
        if (#2 date1) < (#2 date2)
        then true
        else if (#2 date1) > (#2 date2)
        then false
        else 
            if (#3 date1) < (#3 date2)
            then true
            else false

fun number_in_month( dates: (int * int * int) list, month : int) =
    if null dates
    then 0
    else    
        if #2 (hd dates) = month
        then 1 + number_in_month(tl dates, month)
        else 0 + number_in_month(tl dates, month)

fun number_in_months( dates: (int * int * int) list, month : int list) =
    if null month
    then 0
    else
        number_in_month(dates, hd month) + number_in_months(dates, tl month)

fun dates_in_month( dates: (int * int * int) list, month: int) = 
    if null dates 
    then []
    else if #2 (hd dates) = month
        then 
            (hd dates) :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month)

fun dates_in_months( dates: (int * int * int) list, month: int list) = 
    if null month
    then []
    else
        dates_in_month(dates, hd month) @ dates_in_months( dates, tl month)

fun get_nth( xs: string list, y: int) = 
    if y = 1
    then hd xs
    else get_nth(tl xs, y-1)

fun date_to_string( date: int * int * int) =
    let 
        val ms = ["January", "February", "March","April", "May","June","July","August","September","October","November","December"]
    in
        get_nth(ms, #2 date) ^ " " ^ Int.toString(#3 date) ^", "^ Int.toString(#1 date)
    end

fun number_before_reaching_sum(sum : int, xs: int list) = 
    if
        sum > (hd xs)
    then
        1 + number_before_reaching_sum( sum - (hd xs), tl xs)
    else
        0

fun what_month (day: int) =
    let 
        val xs = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(day, xs) + 1
    end

fun month_range (day1: int, day2:int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1+1, day2)

fun oldest(dates: (int * int * int) list) =
    if null dates
    then NONE
    else
        let 
            val oldest_rest = oldest(tl dates)
        in  
            if isSome oldest_rest andalso is_older(hd dates, valOf oldest_rest)
            then SOME (hd dates)
            else if isSome oldest_rest
            then oldest_rest
            else SOME (hd dates)
        end
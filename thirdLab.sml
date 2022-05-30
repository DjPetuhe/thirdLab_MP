fun same_string(s1 : string, s2 : string) =
    s1 = s2

(*First assignment*)

(*a task*)
fun all_except_option([], _) = NONE
  | all_except_option(h::t, str) =
    if same_string(str, h) then SOME(t)
    else case all_except_option(t, str) of
         NONE => NONE
         | SOME e => SOME(h::e)

(*b task*)
fun get_substitutions1([], _) = []
  | get_substitutions1(h::t, str) =
    case all_except_option(h, str) of
    NONE => get_substitutions1(t, str)
    | SOME lst => lst @ get_substitutions1(t, str)

(*c task*)
fun get_substitutions2(strll, str) = 
    let fun tail_recursive([], _, a) = a
          | tail_recursive(h::t, str, a) =
            case all_except_option(h, str) of
            NONE => tail_recursive(t, str, a)
            | SOME lst => tail_recursive(t, str, a @ lst)
    in tail_recursive(strll, str, []) end

(*d task*)
fun similar_names(strll, {first = f, middle = m, last = l}) =
    let fun help([]) = []
          | help(h::t) = {first = h, middle = m, last = l}::help(t)
    in {first = f, middle = m, last = l}::help(get_substitutions2(strll, f)) end

(*-------------------------------------------------*)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(*Second assignment*)

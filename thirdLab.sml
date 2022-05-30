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

(*a task*)
fun card_color((Clubs, _)) = Black
  | card_color((Spades, _)) = Black
  | card_color(_) = Red

(*b task*)
fun card_value((_, Ace)) = 11
  | card_value(_, Num n) = n
  | card_value((_,_)) = 10

(*c task*)
fun remove_card([], c, e) = raise e
  | remove_card(h::t, c, e) =
    if h = c then t
    else h::remove_card(t, c, e)

(*d task*)
fun all_same_color([]) = true
  | all_same_color(h::[]) = true
  | all_same_color(h::m::t) =
    if card_color(h) = card_color(m)
    then all_same_color(m::t)
    else false

(*e task*)
fun sum_cards(cs) =
    let fun tail_recursive([], a) = a
          | tail_recursive(h::t, a) = tail_recursive(t, a + card_value(h))
   in tail_recursive(cs, 0) end

(*f task*)
fun score(cs, g) =
    let fun subScore(cs) =
        if sum_cards(cs) > g
        then 3 * (sum_cards(cs) - g)
        else g - sum_cards(cs)
in 
   if all_same_color(cs)
   then subScore(cs) div 2
   else subScore(cs)
end

(*g task*)
fun officiate(cs, ms, g)=
    let fun step(cs, ms, hand) = 
            if sum_cards(hand) > g
            then score(hand, g)
            else case ms of
                 [] => score(hand, g)
                 |(h::t) => case h of
                            Discard card => step(cs, t, remove_card(hand, card, IllegalMove))     
                            |Draw => case cs of 
                                     [] => score(hand, g)
                                     | (hd::tl) => step(tl,t, hd::hand)                       
   in step(cs, ms, []) end
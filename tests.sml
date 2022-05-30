use "thirdLab.sml";
(*First assignment*)

(*a test*)
fun provided_test1() = 
    let val strList1 = ["first", "second", "third", "fourth"]
        val strList2 = ["first", "third", "fifth", "seventh"]
    in
        (all_except_option(strList1, "second"),
        all_except_option(strList2, "second"))
    end

(*b test*)
fun provided_test2() = 
    let val strList = [["John","Rick"],["Summer","Beth"],["Rick","Morty","Jerry"]]
    in
        (get_substitutions1(strList, "Rick"),
        get_substitutions1(strList, "Beth"),
        get_substitutions1(strList, "Fred"))
    end


(*c test*)
fun provided_test3() = 
    let val strList = [["John","Rick"],["Summer","Beth"],["Rick","Morty","Jerry"]]
    in
        (get_substitutions1(strList, "Rick"),
        get_substitutions1(strList, "Beth"),
        get_substitutions1(strList, "Fred"))
    end

(*d test*)
fun provided_test4() = 
    let val strList = [["John","Rick"],["Summer","Beth"],["Rick","Morty","Jerry"]]
        val name1 = {first = "Rick", middle = "C-137", last = "Sanchez"}
        val name2 = {first = "Beth", middle = "C-137", last = "Smith"}
        val name3 = {first = "Fred", middle = "C-137", last = "Smith"}
    in
        (similar_names(strList, name1),
        similar_names(strList, name2),
        similar_names(strList, name3))
    end

val ans_first = provided_test1()
val ans_second = provided_test2()
val ans_third = provided_test3()
val ans_fourth = provided_test4()

(*Second assignment*)

(*a test*)
fun provided_test5() = 
    let
        val c1 = (Diamonds, King)
        val c2 = (Spades, Ace)
        val c3 = (Clubs, Num 6)
    in
        (card_color(c1),
        card_color(c2),
        card_color(c3))
    end

(*b test*)
fun provided_test6() = 
    let
        val c1 = (Diamonds, King)
        val c2 = (Spades, Ace)
        val c3 = (Clubs, Num 6)
    in
        (card_value(c1),
        card_value(c2),
        card_value(c3))
    end

(*c test*)
fun provided_test7() = 
    let
        val cList = [(Diamonds, King), (Hearts, Queen), (Spades, Ace)]
        val c1 = (Diamonds, King)
        val c2 = (Spades, Ace)
    in
        (remove_card(cList,c1, IllegalMove),
        remove_card(cList, c2, IllegalMove))
    end

(*d test*)
fun provided_test8() = 
    let
        val cList1 = [(Diamonds, King), (Spades, Ace), (Clubs, Num 6)]
        val cList2 = [(Spades, Ace), (Clubs, Num 6)]
        val cList3 = [(Diamonds, King)]
    in
        (all_same_color(cList1),
        all_same_color(cList2),
        all_same_color(cList3))
    end

(*e test*)
fun provided_test9() = 
    let
        val cList1 = [(Diamonds, King), (Spades, Ace), (Clubs, Num 6)]
        val cList2 = [(Spades, Ace), (Clubs, Num 6)]
        val cList3 = [(Diamonds, King)]
    in
        (sum_cards(cList1),
        sum_cards(cList2),
        sum_cards(cList3))
    end

(*f test*)
fun provided_test10() = 
    let
        val cList1 = [(Diamonds, King), (Spades, Ace), (Clubs, Num 6)]
        val cList2 = [(Spades, Ace), (Clubs, Num 6)]
        val cList3 = [(Diamonds, King)]
    in
        (score(cList1, 40),
        score(cList2, 30),
        score(cList3, 15))
    end

(*g test*)
fun provided_test11() = 
    let
        val cList1 = [(Diamonds, King), (Spades, Ace), (Clubs, Num 6)]
        val mList1 = [Draw, Draw, Discard (Spades, Ace)]
        val cList2 = [(Spades, Ace), (Clubs, Num 6)]
        val mList2 = [Draw]
        val cList3 = [(Diamonds, King)]
         val mList3 = [Draw, Discard (Diamonds, King)]
    in
        (officiate(cList1, mList1, 40),
        officiate(cList2, mList2, 20),
        officiate(cList3, mList3, 10))
    end

val ans_fifth = provided_test5()
val ans_sixth = provided_test6()
val ans_seventh = provided_test7()
val ans_eighth = provided_test8()
val ans_ninth = provided_test9()
val ans_tenth = provided_test10()
val ans_eleventh = provided_test11()
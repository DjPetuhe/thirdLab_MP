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
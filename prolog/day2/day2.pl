concatenate([], List, List).
concatenate([Head | Tail1], List, [Head | Tail2]) :- concatenate(Tail1, List, Tail2).

my_reverse([], List).
my_reverse([Head | Tail1], Reversed) :- my_reverse(Tail1, Tail1Reversed), concatenate(Tail1Reversed, [Head], Reversed).
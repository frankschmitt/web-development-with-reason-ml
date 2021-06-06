// takeWhile, naive recursive version
let rec takeWhile = (lst: list<'a>, pred: ('a) => bool) : list<'a> => {
  switch (lst) {
    | list{} => list{}
    | list{hd, ..._} when !pred(hd) => list{}
    | list{hd, ...tl} => Belt.List.concat(list{hd}, takeWhile(tl, pred))
  }
}

// takeWhile, tail-recursive version
let takeWhile2 = (lst: list<'a>, pred: ('a) => bool) : list<'a> => {
  let rec helper = (accumulator: list<'a>, theList: list<'a>) : list<'a> => {
    switch (theList) {
      | list{} => accumulator
      | list{hd, ..._} when !pred(hd) => accumulator
      | list{hd, ...tl} => helper(Belt.List.concat(accumulator, list{hd}), tl)
    }
  }
  helper(list{}, lst)
}

// dropWhile, naive recursive version
//   (which happens to be tail-recursive out of the box :-) )
let rec dropWhile = (lst: list<'a>, pred: ('a) => bool) : list<'a> => {
  switch(lst) {
    | list{} => list{}
    | list{hd, ...tl} when pred(hd) => dropWhile(tl, pred)
    | _ => lst
  } 
}

let stringOfList = (lst: list<'a>, stringify: ('a) => string) : string => {
  let rec helper = (accumulator: string, theList: list<'a>) => {
    switch theList {
      | list{} => ""
      | list{hd, ...list{}} => accumulator ++ stringify(hd)
      | list{hd, ...tl} => helper(accumulator ++ stringify(hd) ++ ",", tl)
    }
  }
  helper("", lst)
}

let data = list{2, 6, 42, 5, 7, 20, 3}
let isEven = (n) => { mod(n,2) == 0 }

let taken   = takeWhile(data, isEven)
let taken2  = takeWhile2(data, isEven)
let dropped = dropWhile(data, isEven)
Js.log("take: " ++ stringOfList(taken, Js.Int.toString)) 
Js.log("take2 " ++ stringOfList(taken2, Js.Int.toString)) 
Js.log("drop: " ++ stringOfList(dropped, Js.Int.toString))

let myMap = (optValue: option<'a>, f: 'a => 'b): option<'b> => {
  switch (optValue) {
    | Some(value) => Some(f(value))
    | None => None
  }
}

let myFlatMap = (optValue: option<'a>, f: 'a => option<'b>): option<'b> => {
  switch(optValue) {
    | Some(value) => f(value)
    | None => None
  }
}

let mySquare = (x: float) : float => {
  x *. x
}

let mySqrt = (x: float) : option<float> => {
  if x >= 0.0 {
    Some(Js.Math.sqrt(x))
  }
  else {
    None
  }
}

// map
Js.log(myMap(Some(2.0), mySquare))
Js.log(myMap(None, mySquare))
// flatMap
Js.log(myFlatMap(Some(2.0), mySqrt))
Js.log(myFlatMap(None, mySqrt))

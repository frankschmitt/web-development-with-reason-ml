let t =  5.0; // temperature in deg celsius
let v = 20.0; // wind velocity in km per hour

let t_wc = 13.12 +. (0.6215 *. t) +. (0.3965 *. t -. 11.37) *. v**0.16;

Js.log("At temperature " ++ Js.Float.toString(t) ++ " degrees Celsius and wind speed " ++ Js.Float.toString(v) ++ " km/h, the wind chill temperature is " ++ Js.Float.toString(t_wc));

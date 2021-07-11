@module("./images/dog.png") external dog: string = "default"
@module("./images/cat.png") external cat: string = "default"
@module("./images/bird.png") external bird: string = "default"
@module("./images/fish.png") external fish: string = "default"

let handleClick = (_event) => Js.log("clicked!");

@react.component
let make = (~species, ~name) => {
  /*
  TODO: use the correct image here instead of always the dog!
  let src = species
  | "dog" => dog
  | "cat" => cat
  | _ => _
  */
  <div onClick={handleClick}>
    {React.string("hello! My name is " ++ name ++ ", and I'm a " ++ species)}
    <img src={dog} alt={species} />
  </div>
}

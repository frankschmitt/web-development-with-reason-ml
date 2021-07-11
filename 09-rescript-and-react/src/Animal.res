@module("./images/dog.png") external dog: string = "default"
@module("./images/cat.png") external cat: string = "default"
@module("./images/bird.png") external bird: string = "default"
@module("./images/fish.png") external fish: string = "default"
@module("./images/unknown.png") external unknown: string = "default"

let handleClick = (_event) => Js.log("clicked!");

@react.component
let make = (~species, ~name) => {
  let src = switch species {
    | "dog" => dog
    | "cat" => cat
    | "bird" => bird
    | "fish" => fish
    | _ => unknown
  }
  <div className="horiz" onClick={handleClick}>
    <img src={src} alt={species} />
    <span><br /></span>
    {React.string(name)}
  </div>
}

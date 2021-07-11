@module("./logo.svg") external logo: string = "default"

%%raw(`import './App.css';`)

@react.component
let make = () => {
  let (count, setCount) = React.useState(() => 0.)

  React.useEffect0(() => {
    let intervalId = Js.Global.setInterval(() => setCount(count => count +. 1.), 100)

    Some(() => Js.Global.clearInterval(intervalId))
  })

  <div className="App">
    <header className="App-header">
      <a className="App-link">{React.string("go for it!")}</a>
      <Animal species="unknown" name="Donald" />
      <Animal species="fish" name="Ella" />
      <Animal species="dog" name="Lady" />
      <Animal species="cat" name="Buffbuff" />
      <Animal species="bird" name="Kim" />
    </header>
  </div>
}

type buttonType = Primary | Link

module Button = {
  @react.component
  let make = (~variant=Primary, ~children) => {
    let className = switch(variant) {
      | Primary => "btn btn-primary"
      | Link => "btn btn-link"
    }

    <button className>{children}</button>
  }
}

// Unfortunately ReScript's bindings are not yet updated for 18.0.0
// but we can easily fix this ourselves.
type reactRoot
@module("react-dom/client")
external createRoot: Dom.element => reactRoot = "createRoot"
@send
external render : (reactRoot, React.element) => unit = "render"

// Tell ReScript about JavaScript's `document.body` property.
@val @scope("document") external body : Dom.element = "body"

body
  ->createRoot
  ->render(
    <div>
      <Button>{React.string("Continue")}</Button>
      <Button variant={Link}>{React.string("cancel")}</Button>
    </div>
  )

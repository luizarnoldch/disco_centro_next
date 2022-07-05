const Input = (props) => {
  return (
    <div className="input-container">
      <input
        type = {props.type}
        placeholder = {props.placeholder}
        value = {props.value}
        id = {props.id}
        name = {props.name}

        autocomplete = {props.autocomplete ? props.autocomplete : false}
        autofocus = {props.autofocus ? props.autofocus : false}
        
      />
      {
        props.type === "password" ? (
          <div className="password">
            <img className="password__img"/>
          </div>
        ) : null
      }
    </div>
  )
}

export default Input
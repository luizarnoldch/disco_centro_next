
const Button = (props:any) => {
  return (
    <div className="button-container">
      <button
        type= {props.type}
      >
        {props.text}
      </button>
      {
        props.image ? 
          <div className="button-container__image">
            <img src={props.image} alt="" />
          </div>
        : null
      }
    </div>
    
  )
}

export default Button
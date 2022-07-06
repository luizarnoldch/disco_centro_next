import Eye from '../../assets/fontawesome-free-6.1.1-web/svgs/regular/eye.svg'

const Input = (props:any) => {
  return (
    <div className="input-container">
      <input
        type = {props.type}
        placeholder = {props.placeholder}
        value = {props.value}
        id= {props.id}
        name = {props.name}
      />
      {
        props.type === "password" ? (
          <div className="input-container__img">
            <img src={Eye} alt="." />
          </div>
        ) : null
      }
    </div>
  )
}

export default Input
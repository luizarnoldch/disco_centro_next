import type { NextPage } from 'next'
import Input from '../layouts/input/Input'


const Home: NextPage = () => {
  
  const eyeOpen:string = `../assets/img/eye.png`

  return (
    <div className='login'>
      <div className="login__header">
        <div className="login__header__titulo">
          Registrate
        </div>
      </div>
      <div className="login__body">
        <div className="login__body__form">

          <label htmlFor="email">Correo</label>
          <Input
            type="email"
            placeholder="Ejemplo@gmail.com"
            autofocus = "autofocus"
            autocomplete= "autocomplete"
            name = "email"
          />
          <label htmlFor="password">Contraseña</label>

          <Input
            type="password"
            placeholder="Introduce tu contraseña"
            name = "password"
          />
          boton-Continuar <br />
        </div>
        
        
        
        {/* <br />
        <div className="separador">
          ------------- o -----------
        </div>
        <br />
        boton-facebook <br />
        boton-google <br />
        boton-twiter <br />
        boton-instagram <br /> */}
      </div>
      <div className="login__footer">
        <div className="login__footer__registro">
          ¿No tienes cuenta? <strong>Registrate</strong>
        </div>
        <div className="login__footer__terminos">
          Al tocar continuar con Google o Continuar con Facebook, aceptas <u>las condiciones de uso y la Política de privacidad de Disco Centro.</u>
        </div>
      </div>
    </div>
  )
}

export default Home

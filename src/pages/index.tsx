import type { NextPage } from 'next'
import Input from '../layouts/input/Input'
import Button from '../layouts/button/Button'
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
        <form className="login__body__form" action="">
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

            <Button
              text = "Continuar"
              type = "submit"
            />
          
        </form>
        <div className="separador">
          <hr />
          <div className="borde-circulo">
            <div className="circulo"></div>
          </div>
          <hr />
        </div>
        <div className="login__body__auth">
          <Button
            text = "Continuar con facebook"
            type = "submit"
            image = "fb"
          />
          <Button
            text = "Continuar con Google"
            type = "submit"
            image = "goo"
          />
          <Button
            text = "Continuar con Twitter"
            type = "submit"
            image = "twt"
          />
          <Button
            text = "Continuar con Instagram"
            type = "submit"
            image = "ig"
          />
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

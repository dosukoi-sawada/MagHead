import React, { useContext } from "react"
import store from "store/loginStore"

// とりあえず認証済みユーザーの名前やメールアドレスを表示
const Home: React.FC = () => {

  return (
    <>
      {
        store.getState().login.user.id ? (
          <>
            <h1>Signed in successfully!</h1>
            <h2>Name: {store.getState().login.user.name}</h2>
          </>
        ) : (
          <h1>Not signed in</h1>
        )
      }
    </>
  )
}

export default Home

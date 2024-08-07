import React, { useState, useEffect, createContext } from "react"
import { BrowserRouter as Router, Route, Routes } from "react-router-dom"

import CommonLayout from "views/layouts/CommonLayout"
import Home from "views/pages/Home"
import SignUp from "views/pages/SignUp"
import SignIn from "views/pages/SignIn"

import { getCurrentUser } from "lib/api/auth"
import { User } from "interfaces/index"
import { ThemeProvider, createTheme } from '@mui/material/styles'



// グローバルで扱う変数・関数
export const AuthContext = createContext({} as {
  loading: boolean
  setLoading: React.Dispatch<React.SetStateAction<boolean>>
  isSignedIn: boolean
  setIsSignedIn: React.Dispatch<React.SetStateAction<boolean>>
  currentUser: User | undefined
  setCurrentUser: React.Dispatch<React.SetStateAction<User | undefined>>
})

const App: React.FC = () => {
  const [loading, setLoading] = useState<boolean>(true)
  const [isSignedIn, setIsSignedIn] = useState<boolean>(false)
  const [currentUser, setCurrentUser] = useState<User | undefined>()

  // 認証済みのユーザーがいるかどうかチェック
  // 確認できた場合はそのユーザーの情報を取得
  const handleGetCurrentUser = async () => {
    try {
      const res = await getCurrentUser()

      if (res?.data.isLogin === true) {
        setIsSignedIn(true)
        setCurrentUser(res?.data.data)

        console.log(res?.data.data)
      } else {
        console.log("No current user")
      }
    } catch (err) {
      console.log(err)
    }

    setLoading(false)
  }

  const theme = createTheme({
    palette: {
      mode: 'light',
       primary: {
         main: '#9565e6',
         light: '#9565e6',
         dark: '#9565e6'
        }
      }  
  })

  useEffect(() => {
    handleGetCurrentUser()
  }, [setCurrentUser])

  return (
    <Router>
      <AuthContext.Provider value={{ loading, setLoading, isSignedIn, setIsSignedIn, currentUser, setCurrentUser}}>
        <ThemeProvider theme={theme}>
          <CommonLayout>
            <Routes>
              <Route path="/signup" element={<SignUp />} />
              <Route path="/signin" element={<SignIn />} />
              <Route path="/" element={<Home />} />
            </Routes>
          </CommonLayout>
        </ThemeProvider>
      </AuthContext.Provider>
    </Router>
  )
}

export default App

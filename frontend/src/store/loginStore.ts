import { configureStore } from '@reduxjs/toolkit'
import reducer from 'slices/loginSlice'

const store = configureStore({
  reducer: {
    login: reducer
  }
})

export default store

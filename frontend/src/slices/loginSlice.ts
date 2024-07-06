import { createSlice } from '@reduxjs/toolkit'

const loginSlice = createSlice({
  name: 'login',
  initialState: {
    user: {
      id: undefined,
      name: undefined,
      type: undefined,
    }
  },
  reducers: {
    setUser: (state, action) => {
      state.user = action.payload
    }
  }
})

export const { setUser } = loginSlice.actions
export default loginSlice.reducer

import { configureStore } from '@reduxjs/toolkit'
import { combineReducers } from "redux";
import reducer from 'slices/loginSlice'

import { persistReducer } from 'redux-persist';
import storage from 'redux-persist/lib/storage';

const reducers = combineReducers({
  login: reducer,
 });

const persistConfig = {
  key: 'root',
  storage
};

const persistedReducer = persistReducer(persistConfig, reducers);

const store = configureStore({
  reducer: persistedReducer,
})

export default store

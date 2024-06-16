import client from "lib/api/client"

// 疎通確認用
export const execTest = () => {
  return client.get("/test")
}

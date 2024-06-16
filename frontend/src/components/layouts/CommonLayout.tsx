import React from "react"

import { Container, Grid } from "@mui/material"

import Header from "components/layouts/Header"

interface CommonLayoutProps {
  children: React.ReactElement
}

// 全てのページで共通となるレイアウト
const CommonLayout = ({ children }: CommonLayoutProps) => {

  return (
    <>
      <header>
        <Header />
      </header>
      <main>
        <Container maxWidth="lg">
          <Grid container justifyContent="center">
            <Grid item>
              {children}
            </Grid>   
          </Grid>
        </Container>
      </main>
    </>
  )
}

export default CommonLayout

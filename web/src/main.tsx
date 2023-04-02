import "./styles/styles.css"
import "react-toastify/dist/ReactToastify.min.css"
import "@rainbow-me/rainbowkit/styles.css"

// import { configureChains, createClient, WagmiConfig } from "wagmi"
// import { mainnet, polygon, optimism, arbitrum } from "wagmi/chains"
// import { alchemyProvider } from "wagmi/providers/alchemy"
// import { publicProvider } from "wagmi/providers/public"

import React from "react"
import ReactDOM from "react-dom/client"
import { WagmiConfig } from "wagmi"
import { wagmiClient } from "./lib/wagmi/wagmiClient"
import { ToastContainer } from "react-toastify"

import { WalletProvider } from "./lib/useWallet"
import { BrowserRouter, Route, Routes, Navigate } from "react-router-dom"
import { PlaygroundPage } from "./routes/PlaygroundPage"
import { HomePage } from "./routes/HomePage"
import { MyCrestsPage } from "./routes/MyCrestsPage"
import { ContractsPage } from "./routes/ContractsPage"
import { GovernancePage } from "./routes/GovernancePage"
import { QueryClient, QueryClientProvider } from "@tanstack/react-query"
import { WagmiProvider } from "./lib/wagmi/WagmiProvider"

const queryClient = new QueryClient()

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <QueryClientProvider client={queryClient}>
      <WagmiProvider>
        <BrowserRouter basename={import.meta.env.BASE_URL}>
          <WalletProvider>
            <Routes>
              <Route path="/" element={<HomePage />} />
              <Route path="/playground" element={<PlaygroundPage />} />
              <Route path="/governance" element={<GovernancePage />} />
              <Route path="/my-crests" element={<MyCrestsPage />} />
              <Route path="/contracts" element={<ContractsPage />} />
              <Route path="*" element={<Navigate to="/" replace />} />
            </Routes>
            <ToastContainer hideProgressBar closeOnClick pauseOnHover closeButton={false} />
          </WalletProvider>
        </BrowserRouter>
      </WagmiProvider>
    </QueryClientProvider>
  </React.StrictMode>
)

import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { registerSW } from "virtual:pwa-register";
import { toast } from "react-hot-toast";
import "./index.css";
import App from "./App.jsx";

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <App />
  </StrictMode>,
);

if (import.meta.env.PROD) {
  const updateSW = registerSW({
    immediate: true,
    onNeedRefresh() {
      toast(
        (t) => (
          <span>
            Versi baru tersedia.{" "}
            <button
              className="font-semibold underline"
              onClick={() => {
                updateSW();
                toast.dismiss(t.id);
              }}
            >
              Muat ulang
            </button>
          </span>
        ),
        {
          duration: Infinity,
        },
      );
    },
    onOfflineReady() {
      toast.success("Aplikasi sekarang bisa digunakan offline.");
    },
  });
} else if ("serviceWorker" in navigator) {
  navigator.serviceWorker.getRegistrations().then((registrations) => {
    registrations.forEach((registration) => registration.unregister());
  });
}

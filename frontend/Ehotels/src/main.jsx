import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./index.css";
import App from "./App.jsx";
import Customer from "./Pages/Customer.jsx";
import Employee from "./Pages/Employee.jsx";
import Stats from "./Pages/Stats.jsx";

const router = createBrowserRouter([
    {
        path: "/",
        element: <App />,
    },
    {
        path: "Customer",
        element: <Customer />,
    },
    {
        path: "Employee",
        element: <Employee />,
    },
    {
        path: "Stats",
        element: <Stats />,
    },
]);

createRoot(document.getElementById("root")).render(
    <StrictMode>
        <RouterProvider router={router} />
    </StrictMode>
);

import React from "react";

export default function card(props) {
    const className = `a ${props.className || ""}`.trim();
    return (
        <div
            className={`${className} p-12 rounded-md bg-white drop-shadow-md flex flex-col gap-4`}
            style={props.style}>
            {props.children}
        </div>
    );
}

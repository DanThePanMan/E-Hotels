import React from "react";
import { useState, useEffect } from "react";

export default function Stats() {
    const [bookings, setBookings] = useState([]);
    const [loadingBookings, setLoadingBookings] = useState(true);
    const [rooms, setRooms] = useState([]);
    const [loadingRooms, setLoadingRooms] = useState(true);

    useEffect(() => {
        fetch("http://localhost:3000/per_area", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then((res) => res.json())
            .then((data) => {
                setRooms(data);
                setLoadingRooms(false);
                console.log(data);
            });

        fetch("http://localhost:3000/agg", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then((res) => res.json())
            .then((data) => {
                setBookings(data);
                setLoadingBookings(false);
                console.log(data);
            });
    }, []);

    return (
        <div className="w-screen h-screen bg-white flex flex-col justify-center items-center p-32">
            <h1>Stats</h1>
            <div className="flex flex-row gap-12 ">
                <div className="flex flex-col gap-12 h-[50rem] overflow-auto justify-center items-center p-24 border">
                    {loadingRooms ? (
                        <p>Loading room stats...</p>
                    ) : (
                        <div className="flex flex-col gap-2">
                            <h2 className="text-2xl">Rooms per Area</h2>
                            <ul>
                                {rooms.map((room, index) => (
                                    <li key={index}>
                                        Area: {room.city}, Rooms:{" "}
                                        {room.availablerooms}
                                    </li>
                                ))}
                            </ul>
                        </div>
                    )}
                </div>
                <div className="flex flex-col gap-12 h-[50rem] justify-center items-center p-24 border">
                    {loadingBookings ? (
                        <p>Loading booking stats...</p>
                    ) : (
                        <div className="flex flex-col justify-start gap-2 h-[50rem] overflow-y-scroll ">
                            <h2 className="text-2xl">Booking Aggregates</h2>
                            <ul>
                                {bookings.map((booking, index) => (
                                    <li key={index}>
                                        Address:{" "}
                                        {`${booking.address.StreetNum} ${booking.address.StreetName}, ${booking.address.City}, ${booking.address.PostalCode}`}{" "}
                                        | Total Capacity:{" "}
                                        {booking.totalcapacity}
                                    </li>
                                ))}
                            </ul>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}

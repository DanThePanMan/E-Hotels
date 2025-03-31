import React, { useState, useEffect } from "react";
import Card from "../components/card";

export default function Customer() {
    const [rooms, setRooms] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        try {
            fetch("http://localhost:3000/hotels", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                },
            })
                .then((res) => res.json())
                .then((data) => {
                    setRooms(data);
                    setLoading(false);
                });
        } catch (error) {
            console.log(error);
        }
    }, []);

    return (
        <div className="w-screen h-screen bg-white flex flex-col justify-start items-center p-32">
            <h1 className="text-3xl font-bold underline text-black">Hotels</h1>
            {loading && <p>Loading...</p>}
            {!loading && rooms.length === 0 && <p>No hotels available</p>}
            {!loading && rooms.length > 0 && (
                <p>{rooms.length} hotels available</p>
            )}
            {!loading && rooms.length > 0 && (
                <div className="grid grid-cols-5 gap-4 mt-4">
                    {rooms.map((hotel) => (
                        <Card
                            key={hotel.id}
                            className="p-4 border rounded-md shadow-md text-black">
                            <h2 className="text-xl font-bold">
                                {hotel.chainname}
                            </h2>
                            <p>City: {hotel.address.City}</p>
                            <p>
                                Street: {hotel.address.StreetNum}{" "}
                                {hotel.address.StreetName}
                            </p>
                            <p>Postal Code: {hotel.address.PostalCode}</p>
                            <p>Email: {hotel.contactinfo.email}</p>
                            <p>
                                Phone:{" "}
                                {hotel.contactinfo.phoneNumbers.join(", ")}
                            </p>
                            <p>Rating: {hotel.rating}</p>
                            <p>Number of Rooms: {hotel.numrooms}</p>
                            <button className="btn mt-2">View Details</button>
                        </Card>
                    ))}
                </div>
            )}
        </div>
    );
}

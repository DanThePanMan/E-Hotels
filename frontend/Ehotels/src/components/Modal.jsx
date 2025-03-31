import React from "react";
import { useEffect, useState } from "react";

export default function Modal(props) {
    const closeModal = props.setModal;
    const [rooms, setRooms] = useState([]);
    const [loading, setLoading] = useState(true);
    const [userName, setUserName] = useState("");
    const [days, setDays] = useState(1);

    function handleBook(roomId) {
        //make a new user
        try {
            fetch("http://localhost:3000/customers", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    name: userName,
                    registrationDate: new Date().toISOString(),
                    address: {
                        City: "Ottawa",
                        StreetName: "Laurier",
                        StreetNum: "100",
                        PostalCode: "00000",
                    },
                }),
            }).then((res) => res.json());
        } catch (error) {
            console.log(error);
        }
        //make a new booking
        try {
            fetch("http://localhost:3000/bookings", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    HotelAddress: props.hotel,
                    CustomerID: 1,
                    RoomID: roomId,
                    CheckInDate: new Date().toISOString(),
                    CheckOutDate: new Date(
                        new Date().setDate(new Date().getDate() + days)
                    ).toISOString(),
                }),
            })
                .then((res) => res.json())
                .then((data) => {
                    console.log(data);
                    alert("Booking created successfully!");
                });
        } catch (error) {
            console.log(error);
        }
    }

    useEffect(() => {
        let url = "http://localhost:3000/hotels/search";

        if (props.mode === "view") {
            url = `http://localhost:3000/rooms/${props.hotel.PostalCode}`;
        } else if (props.filters) {
            url = `http://localhost:3000/rooms/${props.filters.capacity}/${props.filters.chain}/${props.filters.rating}/${props.filters.area}/${props.filters.max_price}/${props.filters.start_date}/${props.filters.end_date}`;
        }

        const fetchData = async () => {
            try {
                const response = await fetch(url, {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                    },
                });
                const data = await response.json();
                setRooms(data);
                setLoading(false);
                console.log(data);
            } catch (error) {
                console.error("Error fetching data:", error);
                setLoading(false);
            }
        };

        fetchData();
    }, [props.mode, props.hotel, props.filters]);

    const handleClose = () => {
        closeModal(false);
    };
    useEffect(() => {
        if (!loading) {
            rooms.forEach((room) => console.log(room));
        }
    }, [rooms, loading]);

    return (
        <div className="fixed inset-0 flex items-center justify-center bg-black/50 ">
            <div className="bg-white p-6 rounded-lg shadow-lg">
                {loading ? (
                    <p>Loading...</p>
                ) : (
                    <ul className="flex flex-col gap-4">
                        {rooms.map((room) => (
                            <li
                                key={room.roomid}
                                className="flex flex-row gap-32 justify-between">
                                <div className="mb-4 flex flex-col gap-2">
                                    <p>
                                        <strong>Capacity:</strong>{" "}
                                        {room.capacity}
                                    </p>
                                    <p>
                                        <strong>Price:</strong> ${room.price}
                                    </p>
                                    <p>
                                        <strong>Extendable:</strong>{" "}
                                        {room.extendable ? "Yes" : "No"}
                                    </p>
                                    <p>
                                        <strong>Amenities:</strong>{" "}
                                        {Object.keys(room.amenities).join(", ")}
                                    </p>
                                    <p>
                                        <strong>View:</strong> {room.view}
                                    </p>
                                </div>
                                <div>
                                    <input
                                        type="text"
                                        placeholder="Enter your name"
                                        className="border border-gray-300 rounded px-2 py-1"
                                        onChange={(e) =>
                                            setUserName(e.target.value)
                                        }
                                    />
                                    <input
                                        type="number"
                                        placeholder="1"
                                        className="border border-gray-300 rounded px-2 py-1"
                                        onChange={(e) =>
                                            setDays(e.target.value)
                                        }
                                    />
                                    <button
                                        className="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 mt-2 h-12"
                                        onClick={() => handleBook(room.roomid)}>
                                        Book
                                    </button>
                                </div>
                            </li>
                        ))}
                    </ul>
                )}
                <p className="mb-4"></p>
                <button
                    className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
                    onClick={handleClose}>
                    Close
                </button>
            </div>
        </div>
    );
}

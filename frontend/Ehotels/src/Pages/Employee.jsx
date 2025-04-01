import React from "react";
import { useState, useEffect } from "react";

export default function Employee() {
    const [bookings, setBookings] = useState([]);
    const [loadingBookings, setLoadingBookings] = useState(true);
    const [rentings, setRentings] = useState([]);
    const [loadingRentings, setLoadingRentings] = useState(true);
    const [update, setUpdate] = useState(false);

    function bookingDeleteHandler(bookingID) {
        fetch(`http://localhost:3000/bookings/${bookingID}`, {
            method: "DELETE",
        })
            .then((res) => {
                if (res.ok) {
                    setRentings((prevRentings) =>
                        prevRentings.filter(
                            (booking) => booking.id !== bookingID
                        )
                    );
                } else {
                    console.error("Failed to delete booking");
                }
            })
            .then(() => {
                setUpdate(true);
            })
            .catch((error) => console.error(error));
    }

    function rentingDeleteHandler(rentingID) {
        fetch(`http://localhost:3000/rentings/${rentingID}`, {
            method: "DELETE",
        })
            .then((res) => {
                if (res.ok) {
                    setRentings((prevRentings) =>
                        prevRentings.filter(
                            (renting) => renting.id !== rentingID
                        )
                    );
                } else {
                    console.error("Failed to delete bookirentingng");
                }
            })
            .then(() => {
                setUpdate(true);
            })
            .catch((error) => console.error(error));
    }

    function bookingConvertHandler(bookingID) {
        fetch(`http://localhost:3000/bookings/${bookingID}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then((res) => {
                if (res.ok) {
                    setRentings((prevRentings) =>
                        prevRentings.filter(
                            (booking) => booking.id !== bookingID
                        )
                    );
                } else {
                    console.error("Failed to convert booking");
                }
            })
            .then(() => {
                setUpdate(true);
            })
            .catch((error) => console.error(error));
    }

    useEffect(() => {
        fetch("http://localhost:3000/bookings")
            .then((res) => res.json())
            .then((data) => {
                setBookings(data);
                setLoadingBookings(false);
            })
            .catch((error) => console.error(error));

        fetch("http://localhost:3000/rentings")
            .then((res) => res.json())
            .then((data) => {
                console.log(data);
                setRentings(data);
                setLoadingRentings(false);
            })
            .catch((error) => console.error(error));

        setUpdate(false);
    }, [update]);

    return (
        <div className="flex flex-col gap-12 justify-center items-center p-24">
            <h1 className="text-3xl">Employee View</h1>
            <div className="flex flex-row gap-12">
                <div className="flex flex-col border border-black p-2 rounded-md shadow-md h-[45rem] w-[40rem]">
                    <h1 className="text-2xl">Bookings</h1>
                    <div className="overflow-y-auto h-[45rem] w-[40rem]">
                        {loadingBookings ? (
                            <p>Loading...</p>
                        ) : (
                            bookings.map((booking) => (
                                <div
                                    className="flex flex-row justify-between p-12"
                                    key={booking.bookingid}>
                                    <div className="border-b border-gray-300 py-2">
                                        <p>
                                            <strong>ID:</strong>{" "}
                                            {booking.bookingid}
                                        </p>
                                        <p>
                                            <strong>Customer:</strong>{" "}
                                            {booking.customername}
                                        </p>
                                        <p>
                                            <strong>Check in date:</strong>{" "}
                                            {booking.checkindate}
                                        </p>
                                        <p>
                                            <strong>Checkout date:</strong>{" "}
                                            {booking.checkoutdate}
                                        </p>
                                    </div>
                                    <div className="flex flex-col gap-2 ml-4">
                                        <button
                                            className="btn"
                                            onClick={() =>
                                                bookingConvertHandler(
                                                    booking.bookingid
                                                )
                                            }>
                                            Convert to renting
                                        </button>
                                        <button
                                            className="btn"
                                            onClick={() =>
                                                bookingDeleteHandler(
                                                    booking.bookingid
                                                )
                                            }>
                                            delete
                                        </button>
                                    </div>
                                </div>
                            ))
                        )}
                    </div>
                </div>
                <div className="flex flex-col border border-black p-2 rounded-md shadow-md h-[45rem] w-[40rem]">
                    <h1 className="text-2xl">Rentings</h1>
                    <div className="overflow-y-auto h-[45rem] w-[40rem]">
                        {loadingRentings ? (
                            <p>Loading...</p>
                        ) : (
                            rentings.map((renting) => (
                                <div
                                    className="flex flex-row justify-between p-12"
                                    key={renting.rentingid}>
                                    <div className="border-b border-gray-300 py-2">
                                        <p>
                                            <strong>ID:</strong>{" "}
                                            {renting.rentingid}
                                        </p>
                                        <p>
                                            <strong>Customer:</strong>{" "}
                                            {renting.customername}
                                        </p>
                                        <p>
                                            <strong>Check in date:</strong>{" "}
                                            {renting.checkindate}
                                        </p>
                                        <p>
                                            <strong>Checkout date:</strong>{" "}
                                            {renting.checkoutdate}
                                        </p>
                                    </div>
                                    <div className="flex flex-col gap-2 ml-4">
                                        <button
                                            className="btn"
                                            onClick={() =>
                                                rentingDeleteHandler(
                                                    renting.rentingid
                                                )
                                            }>
                                            delete
                                        </button>
                                    </div>
                                </div>
                            ))
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}

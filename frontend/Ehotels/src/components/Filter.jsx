import React from "react";
import { useState } from "react";

export default function Filter(props) {
    const [filters, setFilters] = useState({
        capacity: "",
        chain: "",
        rating: "",
        area: "",
        max_price: "",
        start_date: "",
        end_date: "",
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFilters((prevFilters) => ({
            ...prevFilters,
            [name]: value,
        }));
    };

    return (
        <div className="flex flex-col gap-4 bg-white border-2 border-black text-black p-6 rounded-md">
            <h2 className="font-bold text-2xl">Search for a room</h2>
            <div className="flex flex-row jusitfy-between items-center gap-4">
                <label>
                    Capacity:
                    <input
                        className="border"
                        type="number"
                        name="capacity"
                        value={filters.capacity}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Chain:
                    <input
                        className="border"
                        type="text"
                        name="chain"
                        value={filters.chain}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Rating:
                    <input
                        className="border"
                        type="number"
                        name="rating"
                        value={filters.rating}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Area:
                    <input
                        className="border"
                        type="text"
                        name="area"
                        value={filters.area}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Max Price:
                    <input
                        className="border"
                        type="number"
                        name="max_price"
                        value={filters.max_price}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    Start Date:
                    <input
                        className="border"
                        type="date"
                        name="start_date"
                        value={filters.start_date}
                        onChange={handleChange}
                    />
                </label>
                <label>
                    End Date:
                    <input
                        className="border"
                        type="date"
                        name="end_date"
                        value={filters.end_date}
                        onChange={handleChange}
                    />
                </label>
                <button
                    className="btn"
                    onClick={() => {
                        props.setModal(true);
                        props.setMode(filters);
                        props.setFilters(filters);
                    }}>
                    Search
                </button>
            </div>
        </div>
    );
}

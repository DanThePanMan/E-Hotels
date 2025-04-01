import React from "react";
import { useState } from "react";

export default function Filter(props) {
    const [filters, setFilters] = useState({
        capacity: "",
        chain: "",
        rating: "",
        area: "",
        max_price: "",
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
                    <select
                        className="border"
                        name="capacity"
                        value={filters.capacity}
                        onChange={handleChange}>
                        <option value="">Select</option>
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        <option value="Triple">Triple</option>
                        <option value="Suite">Suite</option>
                    </select>
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
                <button
                    className="btn"
                    onClick={() => {
                        if (
                            Object.values(filters).every(
                                (value) => value.trim() !== ""
                            )
                        ) {
                            props.setModal(true);
                            props.setMode(filters);
                            props.setFilters(filters);
                        } else {
                            alert(
                                "Please fill in all fields before searching."
                            );
                        }
                    }}>
                    Search
                </button>
            </div>
        </div>
    );
}

import Card from "./components/Card";
import { Link } from "react-router-dom";

function App() {
    return (
        <div className="w-screen h-screen bg-white flex flex-col justify-start items-center p-32">
            <Card>
                <h1 className="text-3xl font-bold underline text-black">
                    Select your user role
                </h1>
                <div className="flex flex-row gap-4 mt-4 justify-around">
                    <Link to="Customer">
                        <button className="btn">
                            Log in as customer (dan)
                        </button>
                    </Link>
                    <Link to="Employee">
                        <button className="btn">Log in as employee</button>
                    </Link>
                </div>
            </Card>
        </div>
    );
}

export default App;
